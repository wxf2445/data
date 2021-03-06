package cn.com.jtang.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FondsExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    protected List<Criteria> oredCriteria;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    protected int start = -1;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    protected int limit = -1;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public FondsExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
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
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void setStart(int start) {
        this.start=start;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public int getStart() {
        return start;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void setLimit(int limit) {
        this.limit=limit;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public int getLimit() {
        return limit;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
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



        public Criteria andFondsnoIsNull() {
            addCriterion("fondsNo is null");
            return (Criteria) this;
        }

        public Criteria andFondsnoIsNotNull() {
            addCriterion("fondsNo is not null");
            return (Criteria) this;
        }

        public Criteria andFondsnoEqualTo(String value) {
            addCriterion("fondsNo =", value, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoNotEqualTo(String value) {
            addCriterion("fondsNo <>", value, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoGreaterThan(String value) {
            addCriterion("fondsNo >", value, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoGreaterThanOrEqualTo(String value) {
            addCriterion("fondsNo >=", value, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoLessThan(String value) {
            addCriterion("fondsNo <", value, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoLessThanOrEqualTo(String value) {
            addCriterion("fondsNo <=", value, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoLike(String value) {
            addCriterion("fondsNo like", value, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoNotLike(String value) {
            addCriterion("fondsNo not like", value, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoIn(List<String> values) {
            addCriterion("fondsNo in", values, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoNotIn(List<String> values) {
            addCriterion("fondsNo not in", values, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoBetween(String value1, String value2) {
            addCriterion("fondsNo between", value1, value2, "fondsno");
            return (Criteria) this;
        }

        public Criteria andFondsnoNotBetween(String value1, String value2) {
            addCriterion("fondsNo not between", value1, value2, "fondsno");
            return (Criteria) this;
        }

        public Criteria andShidIsNull() {
            addCriterion("shid is null");
            return (Criteria) this;
        }

        public Criteria andShidIsNotNull() {
            addCriterion("shid is not null");
            return (Criteria) this;
        }

        public Criteria andShidEqualTo(String value) {
            addCriterion("shid =", value, "shid");
            return (Criteria) this;
        }

        public Criteria andShidNotEqualTo(String value) {
            addCriterion("shid <>", value, "shid");
            return (Criteria) this;
        }

        public Criteria andShidGreaterThan(String value) {
            addCriterion("shid >", value, "shid");
            return (Criteria) this;
        }

        public Criteria andShidGreaterThanOrEqualTo(String value) {
            addCriterion("shid >=", value, "shid");
            return (Criteria) this;
        }

        public Criteria andShidLessThan(String value) {
            addCriterion("shid <", value, "shid");
            return (Criteria) this;
        }

        public Criteria andShidLessThanOrEqualTo(String value) {
            addCriterion("shid <=", value, "shid");
            return (Criteria) this;
        }

        public Criteria andShidLike(String value) {
            addCriterion("shid like", value, "shid");
            return (Criteria) this;
        }

        public Criteria andShidNotLike(String value) {
            addCriterion("shid not like", value, "shid");
            return (Criteria) this;
        }

        public Criteria andShidIn(List<String> values) {
            addCriterion("shid in", values, "shid");
            return (Criteria) this;
        }

        public Criteria andShidNotIn(List<String> values) {
            addCriterion("shid not in", values, "shid");
            return (Criteria) this;
        }

        public Criteria andShidBetween(String value1, String value2) {
            addCriterion("shid between", value1, value2, "shid");
            return (Criteria) this;
        }

        public Criteria andShidNotBetween(String value1, String value2) {
            addCriterion("shid not between", value1, value2, "shid");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("fonds.name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("fonds.name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("fonds.name =", value, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("fonds.name <>", value, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("fonds.name >", value, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("fonds.name >=", value, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("fonds.name <", value, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("fonds.name <=", value, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("fonds.name like", value, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("fonds.name not like", value, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("fonds.name in", values, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("fonds.name not in", values, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("fonds.name between", value1, value2, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("fonds.name not between", value1, value2, "fonds.name");
            return (Criteria) this;
        }

        public Criteria andDesIsNull() {
            addCriterion("des is null");
            return (Criteria) this;
        }

        public Criteria andDesIsNotNull() {
            addCriterion("des is not null");
            return (Criteria) this;
        }

        public Criteria andDesEqualTo(String value) {
            addCriterion("des =", value, "des");
            return (Criteria) this;
        }

        public Criteria andDesNotEqualTo(String value) {
            addCriterion("des <>", value, "des");
            return (Criteria) this;
        }

        public Criteria andDesGreaterThan(String value) {
            addCriterion("des >", value, "des");
            return (Criteria) this;
        }

        public Criteria andDesGreaterThanOrEqualTo(String value) {
            addCriterion("des >=", value, "des");
            return (Criteria) this;
        }

        public Criteria andDesLessThan(String value) {
            addCriterion("des <", value, "des");
            return (Criteria) this;
        }

        public Criteria andDesLessThanOrEqualTo(String value) {
            addCriterion("des <=", value, "des");
            return (Criteria) this;
        }

        public Criteria andDesLike(String value) {
            addCriterion("des like", value, "des");
            return (Criteria) this;
        }

        public Criteria andDesNotLike(String value) {
            addCriterion("des not like", value, "des");
            return (Criteria) this;
        }

        public Criteria andDesIn(List<String> values) {
            addCriterion("des in", values, "des");
            return (Criteria) this;
        }

        public Criteria andDesNotIn(List<String> values) {
            addCriterion("des not in", values, "des");
            return (Criteria) this;
        }

        public Criteria andDesBetween(String value1, String value2) {
            addCriterion("des between", value1, value2, "des");
            return (Criteria) this;
        }

        public Criteria andDesNotBetween(String value1, String value2) {
            addCriterion("des not between", value1, value2, "des");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNull() {
            addCriterion("fonds.createtime is null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNotNull() {
            addCriterion("fonds.createtime is not null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeEqualTo(Date value) {
            addCriterion("fonds.createtime =", value, "fonds.createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotEqualTo(Date value) {
            addCriterion("fonds.createtime <>", value, "fonds.createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThan(Date value) {
            addCriterion("fonds.createtime >", value, "fonds.createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("fonds.createtime >=", value, "fonds.createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThan(Date value) {
            addCriterion("fonds.createtime <", value, "fonds.createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThanOrEqualTo(Date value) {
            addCriterion("fonds.createtime <=", value, "fonds.createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIn(List<Date> values) {
            addCriterion("fonds.createtime in", values, "fonds.createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotIn(List<Date> values) {
            addCriterion("fonds.createtime not in", values, "fonds.createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeBetween(Date value1, Date value2) {
            addCriterion("fonds.createtime between", value1, value2, "fonds.createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotBetween(Date value1, Date value2) {
            addCriterion("fonds.createtime not between", value1, value2, "fonds.createtime");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table fonds
     *
     * @mbggenerated do_not_delete_during_merge Thu Jul 14 20:50:49 CST 2016
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
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