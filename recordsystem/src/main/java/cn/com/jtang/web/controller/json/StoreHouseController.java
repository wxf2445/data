package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.STRecord;
import cn.com.jtang.po.StoreHouse;
import cn.com.jtang.service.StoreHouseService;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;

import java.util.HashMap;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonStoreHouseController")
@RequestMapping("/json/storehouse")
@SessionAttributes({
        "searchForm"
})
public class StoreHouseController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private StoreHouseService storeHouseService;

    @RequiresAuthentication
    @RequestMapping(
            value = "/recordinfo",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String, Object> recordinfo(STRecord stRecord, RedirectAttributes redirectAttributes, ModelMap model) {
        HashMap<String, Object> result = new HashMap<>();

        result.put("status", storeHouseService.recordInfo(stRecord));

        return result;
    }
    @RequiresAuthentication
    @RequestMapping(
            value = "/sensordata",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map<String, Object> sensordata(@RequestParam(
            value = "id",
            required = true
    ) String id, RedirectAttributes redirectAttributes, ModelMap model) {
        HashMap<String, Object> result = new HashMap<>();

        result.put("sensordata", storeHouseService.getSensorData(id));

        return result;
    }

    /**
     * Method description delete
     *
     * @param storehouseid
     * @param redirectAttributes
     * @param model
     * @return String
     */
    @RequiresAuthentication
    @ResponseBody
    @RequiresPermissions(value = {"deletestorehouse"})
    @RequestMapping(
            value = "/delete",
            method = RequestMethod.GET
    )
    public Map<String, Object> delete(@RequestParam(
            value = "storehouseid",
            required = true
    ) String storehouseid, RedirectAttributes redirectAttributes, ModelMap model) {

        // ���Ի����³���ɾ��
        Map<String, Object> result = new HashMap<>();
    	int status = 0;
    		try{
    			status = storeHouseService.deleteByPrimaryKey(storehouseid);
    		}catch(Exception e){
    			status = -1;
    			e.printStackTrace();
    		}
            //redirectAttributes.addFlashAttribute("deletestatus", status);

            result.put("status", status);

            return result;
        // ��ʵ��������־λ
        // redirectAttributes.addFlashAttribute("deletestatus", storehouseService.delete(storehouseid));

        //return "redirect:/storehouse/manage";
    }

    @RequiresPermissions(value = {"createstorehouse"})
    @ResponseBody
    @RequestMapping(
            value = "/create",
            method = RequestMethod.POST
    )
    public Map<String, Object> storehouseCreate(@ModelAttribute("storeHouse") StoreHouse storeHouse, @RequestParam(
            value = "sn",
            required = false
    ) Boolean sn, @RequestParam(
            value = "page",
            required = false
    ) Integer page, @RequestParam(
            value = "size",
            required = false
    ) Integer size, @RequestParam(
            value = "typeId",
            required = false
    ) String typeId, @RequestParam(
            value = "mode",
            required = false
    ) String mode, final RedirectAttributes redirectAttributes, ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        result.put("status", storeHouseService.insert(storeHouse));

        return result;
    }


    @RequiresPermissions(value = {"createstorehouse", "editstorehouse", "deletestorehouse"}, logical = Logical.OR)
    @ResponseBody
    @RequestMapping(value = "/all", method = RequestMethod.POST)
    public Map<String, Object> all() {

        Map<String, Object> result = new HashMap<>();

        result.put("storehouses", storeHouseService.selectAll());

        return result;
    }

    @RequiresPermissions(value = {"createstorehouse", "editstorehouse", "deletestorehouse"}, logical = Logical.OR)
    @ResponseBody
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public Map<String, Object> view(
            @RequestParam(value = "id", required = true) String id) {

        Map<String, Object> result = new HashMap<>();

        result.put("storehouse", storeHouseService.selectByPrimaryKey(id));

        return result;

    }

    @RequiresPermissions(value = {"editstorehouse"})
    @ResponseBody
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public Map<String, Object> storehouseEdit(
            @ModelAttribute("storeHouse") StoreHouse storeHouse) {

        Map<String, Object> result = new HashMap<>();

        result.put("status", storeHouseService.edit(storeHouse));

        return result;

    }

    @ResponseBody
    @RequestMapping(value = "/checkname", method = RequestMethod.POST)
    public boolean storehouseEdit(@RequestParam(
            value = "name",
            required = false
    ) String name) {

        boolean status = true;

        if (storeHouseService.isExistByName(name)) {
            status = false;
        }

        return status;

    }

    @ResponseBody
    @RequestMapping(value = "/checkno", method = RequestMethod.POST)
    public boolean checkno(@RequestParam(
            value = "no",
            required = false
    ) String no) {

        boolean status = true;

        if (storeHouseService.isExistByNo(no)) {
            status = false;
        }

        return status;

    }

    @ResponseBody
    @RequestMapping(value = "/checkeditname", method = RequestMethod.POST)
    public boolean checkeditname(@RequestParam(
            value = "name",
            required = false
    ) String name, @RequestParam(
            value = "oname",
            required = false
    ) String oname) {

        boolean status = true;

        if (!oname.equals(name) && storeHouseService.isExistByName(name)) {
            status = false;
        }

        return status;

    }

    @ResponseBody
    @RequestMapping(value = "/checkeditno", method = RequestMethod.POST)
    public boolean checkeditno(@RequestParam(
            value = "no",
            required = false
    ) String no, @RequestParam(
            value = "ono",
            required = false
    ) String ono) {

        boolean status = true;

        if (!ono.equals(no) && storeHouseService.isExistByNo(no)) {
            status = false;
        }

        return status;

    }


}


//~ Formatted by Jindent --- http://www.jindent.com
