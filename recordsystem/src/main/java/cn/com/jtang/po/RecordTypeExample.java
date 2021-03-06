package cn.com.jtang.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RecordTypeExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    protected List<Criteria> oredCriteria;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    protected int start = -1;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    protected int limit = -1;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public RecordTypeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public void setStart(int start) {
        this.start=start;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public int getStart() {
        return start;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public void setLimit(int limit) {
        this.limit=limit;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public int getLimit() {
        return limit;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(String value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(String value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(String value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(String value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(String value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(String value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLike(String value) {
            addCriterion("id like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotLike(String value) {
            addCriterion("id not like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<String> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<String> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(String value1, String value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(String value1, String value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andFondsidIsNull() {
            addCriterion("fondsid is null");
            return (Criteria) this;
        }

        public Criteria andFondsidIsNotNull() {
            addCriterion("fondsid is not null");
            return (Criteria) this;
        }

        public Criteria andFondsidEqualTo(String value) {
            addCriterion("fondsid =", value, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidNotEqualTo(String value) {
            addCriterion("fondsid <>", value, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidGreaterThan(String value) {
            addCriterion("fondsid >", value, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidGreaterThanOrEqualTo(String value) {
            addCriterion("fondsid >=", value, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidLessThan(String value) {
            addCriterion("fondsid <", value, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidLessThanOrEqualTo(String value) {
            addCriterion("fondsid <=", value, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidLike(String value) {
            addCriterion("fondsid like", value, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidNotLike(String value) {
            addCriterion("fondsid not like", value, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidIn(List<String> values) {
            addCriterion("fondsid in", values, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidNotIn(List<String> values) {
            addCriterion("fondsid not in", values, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidBetween(String value1, String value2) {
            addCriterion("fondsid between", value1, value2, "fondsid");
            return (Criteria) this;
        }

        public Criteria andFondsidNotBetween(String value1, String value2) {
            addCriterion("fondsid not between", value1, value2, "fondsid");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }
        public Criteria andTypeNoEqualTo(String value) {
            addCriterion("typeNo =", value, "typeNo");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("recordtype.name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andVolumetableIsNull() {
            addCriterion("volumetable is null");
            return (Criteria) this;
        }

        public Criteria andVolumetableIsNotNull() {
            addCriterion("volumetable is not null");
            return (Criteria) this;
        }

        public Criteria andVolumetableEqualTo(String value) {
            addCriterion("volumetable =", value, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableNotEqualTo(String value) {
            addCriterion("volumetable <>", value, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableGreaterThan(String value) {
            addCriterion("volumetable >", value, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableGreaterThanOrEqualTo(String value) {
            addCriterion("volumetable >=", value, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableLessThan(String value) {
            addCriterion("volumetable <", value, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableLessThanOrEqualTo(String value) {
            addCriterion("volumetable <=", value, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableLike(String value) {
            addCriterion("volumetable like", value, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableNotLike(String value) {
            addCriterion("volumetable not like", value, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableIn(List<String> values) {
            addCriterion("volumetable in", values, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableNotIn(List<String> values) {
            addCriterion("volumetable not in", values, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableBetween(String value1, String value2) {
            addCriterion("volumetable between", value1, value2, "volumetable");
            return (Criteria) this;
        }

        public Criteria andVolumetableNotBetween(String value1, String value2) {
            addCriterion("volumetable not between", value1, value2, "volumetable");
            return (Criteria) this;
        }

        public Criteria andRecordtableIsNull() {
            addCriterion("recordtable is null");
            return (Criteria) this;
        }

        public Criteria andRecordtableIsNotNull() {
            addCriterion("recordtable is not null");
            return (Criteria) this;
        }

        public Criteria andRecordtableEqualTo(String value) {
            addCriterion("recordtable =", value, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableNotEqualTo(String value) {
            addCriterion("recordtable <>", value, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableGreaterThan(String value) {
            addCriterion("recordtable >", value, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableGreaterThanOrEqualTo(String value) {
            addCriterion("recordtable >=", value, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableLessThan(String value) {
            addCriterion("recordtable <", value, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableLessThanOrEqualTo(String value) {
            addCriterion("recordtable <=", value, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableLike(String value) {
            addCriterion("recordtable like", value, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableNotLike(String value) {
            addCriterion("recordtable not like", value, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableIn(List<String> values) {
            addCriterion("recordtable in", values, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableNotIn(List<String> values) {
            addCriterion("recordtable not in", values, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableBetween(String value1, String value2) {
            addCriterion("recordtable between", value1, value2, "recordtable");
            return (Criteria) this;
        }

        public Criteria andRecordtableNotBetween(String value1, String value2) {
            addCriterion("recordtable not between", value1, value2, "recordtable");
            return (Criteria) this;
        }

        public Criteria andTemtableindexIsNull() {
            addCriterion("temtableindex is null");
            return (Criteria) this;
        }

        public Criteria andTemtableindexIsNotNull() {
            addCriterion("temtableindex is not null");
            return (Criteria) this;
        }

        public Criteria andTemtableindexEqualTo(Integer value) {
            addCriterion("temtableindex =", value, "temtableindex");
            return (Criteria) this;
        }

        public Criteria andTemtableindexNotEqualTo(Integer value) {
            addCriterion("temtableindex <>", value, "temtableindex");
            return (Criteria) this;
        }

        public Criteria andTemtableindexGreaterThan(Integer value) {
            addCriterion("temtableindex >", value, "temtableindex");
            return (Criteria) this;
        }

        public Criteria andTemtableindexGreaterThanOrEqualTo(Integer value) {
            addCriterion("temtableindex >=", value, "temtableindex");
            return (Criteria) this;
        }

        public Criteria andTemtableindexLessThan(Integer value) {
            addCriterion("temtableindex <", value, "temtableindex");
            return (Criteria) this;
        }

        public Criteria andTemtableindexLessThanOrEqualTo(Integer value) {
            addCriterion("temtableindex <=", value, "temtableindex");
            return (Criteria) this;
        }

        public Criteria andTemtableindexIn(List<Integer> values) {
            addCriterion("temtableindex in", values, "temtableindex");
            return (Criteria) this;
        }

        public Criteria andTemtableindexNotIn(List<Integer> values) {
            addCriterion("temtableindex not in", values, "temtableindex");
            return (Criteria) this;
        }

        public Criteria andTemtableindexBetween(Integer value1, Integer value2) {
            addCriterion("temtableindex between", value1, value2, "temtableindex");
            return (Criteria) this;
        }

        public Criteria andTemtableindexNotBetween(Integer value1, Integer value2) {
            addCriterion("temtableindex not between", value1, value2, "temtableindex");
            return (Criteria) this;
        }

        public Criteria andTypenoIsNull() {
            addCriterion("typeNo is null");
            return (Criteria) this;
        }

        public Criteria andTypenoIsNotNull() {
            addCriterion("typeNo is not null");
            return (Criteria) this;
        }

        public Criteria andTypenoEqualTo(String value) {
            addCriterion("typeNo =", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoNotEqualTo(String value) {
            addCriterion("typeNo <>", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoGreaterThan(String value) {
            addCriterion("typeNo >", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoGreaterThanOrEqualTo(String value) {
            addCriterion("typeNo >=", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoLessThan(String value) {
            addCriterion("typeNo <", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoLessThanOrEqualTo(String value) {
            addCriterion("typeNo <=", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoLike(String value) {
            addCriterion("typeNo like", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoNotLike(String value) {
            addCriterion("typeNo not like", value, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoIn(List<String> values) {
            addCriterion("typeNo in", values, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoNotIn(List<String> values) {
            addCriterion("typeNo not in", values, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoBetween(String value1, String value2) {
            addCriterion("typeNo between", value1, value2, "typeno");
            return (Criteria) this;
        }

        public Criteria andTypenoNotBetween(String value1, String value2) {
            addCriterion("typeNo not between", value1, value2, "typeno");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNull() {
            addCriterion("createtime is null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNotNull() {
            addCriterion("createtime is not null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeEqualTo(Date value) {
            addCriterion("recordtype.createtime =", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotEqualTo(Date value) {
            addCriterion("createtime <>", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThan(Date value) {
            addCriterion("createtime >", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("createtime >=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThan(Date value) {
            addCriterion("createtime <", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThanOrEqualTo(Date value) {
            addCriterion("createtime <=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIn(List<Date> values) {
            addCriterion("createtime in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotIn(List<Date> values) {
            addCriterion("createtime not in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeBetween(Date value1, Date value2) {
            addCriterion("recordtype.createtime between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotBetween(Date value1, Date value2) {
            addCriterion("createtime not between", value1, value2, "createtime");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table recordtype
     *
     * @mbggenerated do_not_delete_during_merge Fri Jul 22 10:57:40 CST 2016
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table recordtype
     *
     * @mbggenerated Fri Jul 22 10:57:40 CST 2016
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}