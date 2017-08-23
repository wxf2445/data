<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--#if GENERIC || CHROME-->
    <meta name="google" content="notranslate">
<!--#endif-->
    <title>PDF.js viewer</title>


    <link rel="stylesheet" href="viewer.css"/>
    <link rel="resource" type="application/l10n" href="locale/locale.properties"/>
    <script src="compatibility.js"></script>

    <script src="../external/webL10n/l10n.js"></script>
    <script src="../src/shared/util.js"></script>
    <script src="../src/shared/annotation.js"></script>
    <script src="../src/display/api.js"></script>
    <script src="../src/display/metadata.js"></script>
    <script src="../src/display/canvas.js"></script>
    <script src="../src/display/webgl.js"></script>
    <script src="../src/display/pattern_helper.js"></script>
    <script src="../src/display/font_loader.js"></script>
    <script>PDFJS.workerSrc = '../src/worker_loader.js';</script>
    <script src="ui_utils.js"></script>
    <script src="default_preferences.js"></script>
    <script src="preferences.js"></script>
    <script src="download_manager.js"></script>
    <script src="view_history.js"></script>
    <script src="page_view.js"></script>
    <script src="thumbnail_view.js"></script>
    <script src="text_layer_builder.js"></script>
    <script src="document_outline_view.js"></script>
    <script src="document_attachments_view.js"></script>
    <script src="pdf_find_bar.js"></script>
    <script src="pdf_find_controller.js"></script>
    <script src="pdf_history.js"></script>
    <script src="secondary_toolbar.js"></script>
    <script src="presentation_mode.js"></script>
    <script src="grab_to_pan.js"></script>
    <script src="hand_tool.js"></script>
    <script src="overlay_manager.js"></script>
    <script src="password_prompt.js"></script>
    <script src="document_properties.js"></script>
    <script src="debugger.js"></script>
    <script type="text/javascript">
   		var DEFAULT_URL = "MVC.pdf";//相对位置
    </script>
    <script src="viewer.js"></script>
  </head>
<body tabindex="1">
    <div id="outerContainer" class="loadingInProgress" style="width:780px;height:540px">

      <div id="sidebarContainer">
        <div id="toolbarSidebar">
          <div class="splitToolbarButton toggled">
            <button id="viewThumbnail" class="toolbarButton group toggled" title="显示缩略图" tabindex="2" data-l10n-id="thumbs">
               <span data-l10n-id="thumbs_label">缩略图</span>
            </button>
            <button id="viewOutline" class="toolbarButton group" title="显示文档大纲" tabindex="3" data-l10n-id="outline">
               <span data-l10n-id="outline_label">文档大纲</span>
            </button>
            <button id="viewAttachments" class="toolbarButton group" title="显示附件" tabindex="4" data-l10n-id="attachments">
               <span data-l10n-id="attachments_label">附件</span>
            </button>
          </div>
        </div>
        <div id="sidebarContent">
          <div id="thumbnailView">
          </div>
          <div id="outlineView" class="hidden">
          </div>
          <div id="attachmentsView" class="hidden">
          </div>
        </div>
      </div>  <!-- sidebarContainer -->

      <div id="mainContainer">
        <div class="findbar hidden doorHanger hiddenSmallView" id="findbar">
          <label for="findInput" class="toolbarLabel" data-l10n-id="find_label">查找:</label>
          <input id="findInput" class="toolbarField" tabindex="41">
          <div class="splitToolbarButton">
            <button class="toolbarButton findPrevious" title="查找词语上一次出现的位置" id="findPrevious" tabindex="42" data-l10n-id="find_previous">
              <span data-l10n-id="find_previous_label">查找词语上一次出现的位置</span>
            </button>
            <div class="splitToolbarButtonSeparator"></div>
            <button class="toolbarButton findNext" title="查找词语后一次出现的位置" id="findNext" tabindex="43" data-l10n-id="find_next">
              <span data-l10n-id="find_next_label">查找词语后一次出现的位置</span>
            </button>
          </div>
          <input type="checkbox" id="findHighlightAll" class="toolbarField">
          <label for="findHighlightAll" class="toolbarLabel" tabindex="44" data-l10n-id="find_highlight">全部高亮显示</label>
          <input type="checkbox" id="findMatchCase" class="toolbarField">
          <label for="findMatchCase" class="toolbarLabel" tabindex="45" data-l10n-id="find_match_case_label">区分大小写</label>
          <span id="findMsg" class="toolbarLabel"></span>
        </div>  <!-- findbar -->

        <div id="secondaryToolbar" class="secondaryToolbar hidden doorHangerRight">
          <div id="secondaryToolbarButtonContainer">
            <button id="secondaryPresentationMode" class="secondaryToolbarButton presentationMode visibleLargeView" title="切换到演示模式" tabindex="19" data-l10n-id="presentation_mode">
              <span data-l10n-id="presentation_mode_label">切换到演示模式</span>
            </button>

            <button id="secondaryOpenFile" class="secondaryToolbarButton openFile visibleLargeView" title="打开文件" tabindex="20" data-l10n-id="open_file">
              <span data-l10n-id="open_file_label">打开文件</span>
            </button>

            <button id="secondaryPrint" class="secondaryToolbarButton print visibleMediumView" title="打印" tabindex="21" data-l10n-id="print">
              <span data-l10n-id="print_label">打印</span>
            </button>

            <button id="secondaryDownload" class="secondaryToolbarButton download visibleMediumView" title="下载" tabindex="22" data-l10n-id="download">
              <span data-l10n-id="download_label">下载</span>
            </button>

            <a href="#" id="secondaryViewBookmark" class="secondaryToolbarButton bookmark visibleSmallView" title="当前视图（复制或在新窗口中打开）" tabindex="23" data-l10n-id="bookmark">
              <span data-l10n-id="bookmark_label">当前视图</span>
            </a>

            <div class="horizontalToolbarSeparator visibleLargeView"></div>

            <button id="firstPage" class="secondaryToolbarButton firstPage" title="转到第一页" tabindex="24" data-l10n-id="first_page">
              <span data-l10n-id="first_page_label">转到第一页</span>
            </button>
            <button id="lastPage" class="secondaryToolbarButton lastPage" title="转到最后一页" tabindex="25" data-l10n-id="last_page">
              <span data-l10n-id="last_page_label">转到最后一页</span>
            </button>

            <div class="horizontalToolbarSeparator"></div>

            <button id="pageRotateCw" class="secondaryToolbarButton rotateCw" title="顺时针旋转" tabindex="26" data-l10n-id="page_rotate_cw">
              <span data-l10n-id="page_rotate_cw_label">顺时针旋转</span>
            </button>
            <button id="pageRotateCcw" class="secondaryToolbarButton rotateCcw" title="逆时针旋转" tabindex="27" data-l10n-id="page_rotate_ccw">
              <span data-l10n-id="page_rotate_ccw_label">逆时针旋转</span>
            </button>

            <div class="horizontalToolbarSeparator"></div>

            <button id="toggleHandTool" class="secondaryToolbarButton handTool" title="启用手形工具" tabindex="28" data-l10n-id="hand_tool_enable">
              <span data-l10n-id="hand_tool_enable_label">启用手形工具</span>
            </button>
            
            <div class="horizontalToolbarSeparator"></div>

            <button id="documentProperties" class="secondaryToolbarButton documentProperties" title="文档属性…" tabindex="29" data-l10n-id="document_properties">
              <span data-l10n-id="document_properties_label">文档属性…</span>
            </button>
          </div>
        </div>  <!-- secondaryToolbar -->

        <div class="toolbar">
          <div id="toolbarContainer">
            <div id="toolbarViewer">
              <div id="toolbarViewerLeft">
                <button id="sidebarToggle" class="toolbarButton" title="切换侧栏" tabindex="5" data-l10n-id="toggle_sidebar">
                  <span data-l10n-id="toggle_sidebar_label">切换侧栏</span>
                </button>
                <div class="toolbarButtonSpacer"></div>
                <button id="viewFind" class="toolbarButton group hiddenSmallView" title="在文档中查找" tabindex="6" data-l10n-id="findbar">
                   <span data-l10n-id="findbar_label">查找</span>
                </button>
                <div class="splitToolbarButton">
                  <button class="toolbarButton pageUp" title="下一页" id="previous" tabindex="7" data-l10n-id="previous">
                    <span data-l10n-id="previous_label">下一页</span>
                  </button>
                  <div class="splitToolbarButtonSeparator"></div>
                  <button class="toolbarButton pageDown" title="上一页" id="next" tabindex="8" data-l10n-id="next">
                    <span data-l10n-id="next_label">上一页</span>
                  </button>
                </div>
                <label id="pageNumberLabel" class="toolbarLabel" for="pageNumber" data-l10n-id="page_label">页面: </label>
                <input type="number" id="pageNumber" class="toolbarField pageNumber" value="1" size="4" min="1" tabindex="9">
                <span id="numPages" class="toolbarLabel"></span>
              </div>
              <div id="toolbarViewerRight">
                <button id="presentationMode" class="toolbarButton presentationMode hiddenLargeView" title="切换到演示模式" tabindex="13" data-l10n-id="presentation_mode">
                  <span data-l10n-id="presentation_mode_label">切换到演示模式</span>
                </button>

                <button id="openFile" class="toolbarButton openFile hiddenLargeView" title="打开文件" tabindex="14" data-l10n-id="open_file">
                  <span data-l10n-id="open_file_label">打开文件</span>
                </button>

                <button id="print" class="toolbarButton print hiddenMediumView" title="打印" tabindex="15" data-l10n-id="print">
                  <span data-l10n-id="print_label">打印</span>
                </button>

                <button id="download" class="toolbarButton download hiddenMediumView" title="下载" tabindex="16" data-l10n-id="download">
                  <span data-l10n-id="download_label">下载</span>
                </button>
                <!-- <div class="toolbarButtonSpacer"></div> -->
                <a href="#" id="viewBookmark" class="toolbarButton bookmark hiddenSmallView" title="当前视图（复制或在新窗口中打开）" tabindex="17" data-l10n-id="bookmark">
                  <span data-l10n-id="bookmark_label">当前视图</span>
                </a>

                <div class="verticalToolbarSeparator hiddenSmallView"></div>
                
                <button id="secondaryToolbarToggle" class="toolbarButton" title="Tools" tabindex="18" data-l10n-id="tools">
                  <span data-l10n-id="tools_label">工具</span>
                </button> 
              </div>
              <div class="outerCenter">
                <div class="innerCenter" id="toolbarViewerMiddle">
                  <div class="splitToolbarButton">
                    <button id="zoomOut" class="toolbarButton zoomOut" title="缩小" tabindex="10" data-l10n-id="zoom_out">
                      <span data-l10n-id="zoom_out_label">缩小</span>
                    </button>
                    <div class="splitToolbarButtonSeparator"></div>
                    <button id="zoomIn" class="toolbarButton zoomIn" title="放大" tabindex="11" data-l10n-id="zoom_in">
                      <span data-l10n-id="zoom_in_label">放大</span>
                     </button>
                  </div>
                  <span id="scaleSelectContainer" class="dropdownToolbarButton">
                     <select id="scaleSelect" title="Zoom" tabindex="12" data-l10n-id="zoom">
                      <option id="pageAutoOption" title="" value="auto" selected="selected" data-l10n-id="page_scale_auto">自动缩放</option>
                      <option id="pageActualOption" title="" value="page-actual" data-l10n-id="page_scale_actual">实际大小</option>
                      <option id="pageFitOption" title="" value="page-fit" data-l10n-id="page_scale_fit">适合页面</option>
                      <option id="pageWidthOption" title="" value="page-width" data-l10n-id="page_scale_width">适合页宽</option>
                      <option id="customScaleOption" title="" value="custom"></option>
                      <option title="" value="0.5">50%</option>
                      <option title="" value="0.75">75%</option>
                      <option title="" value="1">100%</option>
                      <option title="" value="1.25">125%</option>
                      <option title="" value="1.5">150%</option>
                      <option title="" value="2">200%</option>
                    </select>
                  </span>
                </div>
              </div>
            </div>
            <div id="loadingBar">
              <div class="progress">
                <div class="glimmer">
                </div>
              </div>
            </div>
          </div>
        </div>

        <menu type="context" id="viewerContextMenu">
          <menuitem id="contextFirstPage" label="First Page"
                    data-l10n-id="first_page"></menuitem>
          <menuitem id="contextLastPage" label="Last Page"
                    data-l10n-id="last_page"></menuitem>
          <menuitem id="contextPageRotateCw" label="Rotate Clockwise"
                    data-l10n-id="page_rotate_cw"></menuitem>
          <menuitem id="contextPageRotateCcw" label="Rotate Counter-Clockwise"
                    data-l10n-id="page_rotate_ccw"></menuitem>
        </menu>

        <div id="viewerContainer" tabindex="0">
          <div id="viewer"></div>
        </div>

        <div id="errorWrapper" hidden='true'>
          <div id="errorMessageLeft">
            <span id="errorMessage"></span>
            <button id="errorShowMore" data-l10n-id="error_more_info">
              More Information
            </button>
            <button id="errorShowLess" data-l10n-id="error_less_info" hidden='true'>
              Less Information
            </button>
          </div>
          <div id="errorMessageRight">
            <button id="errorClose" data-l10n-id="error_close">
              Close
            </button>
          </div>
          <div class="clearBoth"></div>
          <textarea id="errorMoreInfo" hidden='true' readonly="readonly"></textarea>
        </div>
      </div> <!-- mainContainer -->

      <div id="overlayContainer" class="hidden">
        <div id="passwordOverlay" class="container hidden">
          <div class="dialog">
            <div class="row">
              <p id="passwordText" data-l10n-id="password_label">Enter the password to open this PDF file:</p>
            </div>
            <div class="row">
              <input type="password" id="password" class="toolbarField" />
            </div>
            <div class="buttonRow">
              <button id="passwordCancel" class="overlayButton"><span data-l10n-id="password_cancel">Cancel</span></button>
              <button id="passwordSubmit" class="overlayButton"><span data-l10n-id="password_ok">OK</span></button>
            </div>
          </div>
        </div>
        <div id="documentPropertiesOverlay" class="container hidden">
          <div class="dialog">
            <div class="row">
              <span data-l10n-id="document_properties_file_name">文件名:</span> <p id="fileNameField">-</p>
            </div>
            <div class="row">
              <span data-l10n-id="document_properties_file_size">文件大小:</span> <p id="fileSizeField">-</p>
            </div>
            <div class="separator"></div>
            <div class="row">
              <span data-l10n-id="document_properties_title">标题:</span> <p id="titleField">-</p>
            </div>
            <div class="row">
              <span data-l10n-id="document_properties_author">作者:</span> <p id="authorField">-</p>
            </div>
            <div class="row">
              <span data-l10n-id="document_properties_subject">主题:</span> <p id="subjectField">-</p>
            </div>
            <div class="row">
              <span data-l10n-id="document_properties_keywords">关键字:</span> <p id="keywordsField">-</p>
            </div>
            <div class="row">
              <span data-l10n-id="document_properties_creation_date">创建日期:</span> <p id="creationDateField">-</p>
            </div>
            <div class="row">
              <span data-l10n-id="document_properties_modification_date">修改日期:</span> <p id="modificationDateField">-</p>
            </div>
            <div class="row">
              <span data-l10n-id="document_properties_creator">创建者:</span> <p id="creatorField">-</p>
            </div>
            <div class="separator"></div>
            <div class="row">
              <span data-l10n-id="document_properties_producer">PDF 制作者:</span> <p id="producerField">-</p>
            </div>
            <div class="row">
              <span data-l10n-id="document_properties_version">PDF 版本:</span> <p id="versionField">-</p>
            </div>
            <div class="row">
              <span data-l10n-id="document_properties_page_count">页数:</span> <p id="pageCountField">-</p>
            </div>
            <div class="buttonRow">
              <button id="documentPropertiesClose" class="overlayButton"><span data-l10n-id="document_properties_close">关闭</span></button>
            </div>
          </div>
        </div>
      </div>  <!-- overlayContainer -->

    </div> <!-- outerContainer -->
    <div id="printContainer"></div>
  </body>

</html>
