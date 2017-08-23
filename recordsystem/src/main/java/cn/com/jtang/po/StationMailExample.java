package cn.com.jtang.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class StationMailExample {
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	protected List<Criteria> oredCriteria;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	protected int start = -1;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	protected int limit = -1;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public StationMailExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public void setStart(int start) {
		this.start = start;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public int getStart() {
		return start;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public void setLimit(int limit) {
		this.limit = limit;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
	 */
	public int getLimit() {
		return limit;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
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

		protected void addCriterion(String condition, Object value,
				String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property
						+ " cannot be null");
			}
			criteria.add(new Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1,
				Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property
						+ " cannot be null");
			}
			criteria.add(new Criterion(condition, value1, value2));
		}

		public Criteria andMailidIsNull() {
			addCriterion("mailid is null");
			return (Criteria) this;
		}

		public Criteria andMailidIsNotNull() {
			addCriterion("mailid is not null");
			return (Criteria) this;
		}

		public Criteria andMailidEqualTo(String value) {
			addCriterion("mailid =", value, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidNotEqualTo(String value) {
			addCriterion("mailid <>", value, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidGreaterThan(String value) {
			addCriterion("mailid >", value, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidGreaterThanOrEqualTo(String value) {
			addCriterion("mailid >=", value, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidLessThan(String value) {
			addCriterion("mailid <", value, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidLessThanOrEqualTo(String value) {
			addCriterion("mailid <=", value, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidLike(String value) {
			addCriterion("mailid like", value, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidNotLike(String value) {
			addCriterion("mailid not like", value, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidIn(List<String> values) {
			addCriterion("mailid in", values, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidNotIn(List<String> values) {
			addCriterion("mailid not in", values, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidBetween(String value1, String value2) {
			addCriterion("mailid between", value1, value2, "mailid");
			return (Criteria) this;
		}

		public Criteria andMailidNotBetween(String value1, String value2) {
			addCriterion("mailid not between", value1, value2, "mailid");
			return (Criteria) this;
		}

		public Criteria andFormUserIsNull() {
			addCriterion("form_user is null");
			return (Criteria) this;
		}

		public Criteria andFormUserIsNotNull() {
			addCriterion("form_user is not null");
			return (Criteria) this;
		}

		public Criteria andFormUserEqualTo(String value) {
			addCriterion("form_user =", value, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserNotEqualTo(String value) {
			addCriterion("form_user <>", value, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserGreaterThan(String value) {
			addCriterion("form_user >", value, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserGreaterThanOrEqualTo(String value) {
			addCriterion("form_user >=", value, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserLessThan(String value) {
			addCriterion("form_user <", value, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserLessThanOrEqualTo(String value) {
			addCriterion("form_user <=", value, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserLike(String value) {
			addCriterion("form_user like", value, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserNotLike(String value) {
			addCriterion("form_user not like", value, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserIn(List<String> values) {
			addCriterion("form_user in", values, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserNotIn(List<String> values) {
			addCriterion("form_user not in", values, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserBetween(String value1, String value2) {
			addCriterion("form_user between", value1, value2, "formUser");
			return (Criteria) this;
		}

		public Criteria andFormUserNotBetween(String value1, String value2) {
			addCriterion("form_user not between", value1, value2, "formUser");
			return (Criteria) this;
		}

		public Criteria andToUserIsNull() {
			addCriterion("to_user is null");
			return (Criteria) this;
		}

		public Criteria andToUserIsNotNull() {
			addCriterion("to_user is not null");
			return (Criteria) this;
		}

		public Criteria andToUserEqualTo(String value) {
			addCriterion("to_user =", value, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserNotEqualTo(String value) {
			addCriterion("to_user <>", value, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserGreaterThan(String value) {
			addCriterion("to_user >", value, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserGreaterThanOrEqualTo(String value) {
			addCriterion("to_user >=", value, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserLessThan(String value) {
			addCriterion("to_user <", value, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserLessThanOrEqualTo(String value) {
			addCriterion("to_user <=", value, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserLike(String value) {
			addCriterion("to_user like", value, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserNotLike(String value) {
			addCriterion("to_user not like", value, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserIn(List<String> values) {
			addCriterion("to_user in", values, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserNotIn(List<String> values) {
			addCriterion("to_user not in", values, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserBetween(String value1, String value2) {
			addCriterion("to_user between", value1, value2, "toUser");
			return (Criteria) this;
		}

		public Criteria andToUserNotBetween(String value1, String value2) {
			addCriterion("to_user not between", value1, value2, "toUser");
			return (Criteria) this;
		}

		public Criteria andTitleIsNull() {
			addCriterion("title is null");
			return (Criteria) this;
		}

		public Criteria andTitleIsNotNull() {
			addCriterion("title is not null");
			return (Criteria) this;
		}

		public Criteria andTitleEqualTo(String value) {
			addCriterion("title =", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleNotEqualTo(String value) {
			addCriterion("title <>", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleGreaterThan(String value) {
			addCriterion("title >", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleGreaterThanOrEqualTo(String value) {
			addCriterion("title >=", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleLessThan(String value) {
			addCriterion("title <", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleLessThanOrEqualTo(String value) {
			addCriterion("title <=", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleLike(String value) {
			addCriterion("title like", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleNotLike(String value) {
			addCriterion("title not like", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleIn(List<String> values) {
			addCriterion("title in", values, "title");
			return (Criteria) this;
		}

		public Criteria andTitleNotIn(List<String> values) {
			addCriterion("title not in", values, "title");
			return (Criteria) this;
		}

		public Criteria andTitleBetween(String value1, String value2) {
			addCriterion("title between", value1, value2, "title");
			return (Criteria) this;
		}

		public Criteria andTitleNotBetween(String value1, String value2) {
			addCriterion("title not between", value1, value2, "title");
			return (Criteria) this;
		}

		public Criteria andCreateTimeIsNull() {
			addCriterion("create_time is null");
			return (Criteria) this;
		}

		public Criteria andCreateTimeIsNotNull() {
			addCriterion("create_time is not null");
			return (Criteria) this;
		}

		public Criteria andCreateTimeEqualTo(Date value) {
			addCriterion("create_time =", value, "createTime");
			return (Criteria) this;
		}

		public Criteria andCreateTimeNotEqualTo(Date value) {
			addCriterion("create_time <>", value, "createTime");
			return (Criteria) this;
		}

		public Criteria andCreateTimeGreaterThan(Date value) {
			addCriterion("create_time >", value, "createTime");
			return (Criteria) this;
		}

		public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
			addCriterion("create_time >=", value, "createTime");
			return (Criteria) this;
		}

		public Criteria andCreateTimeLessThan(Date value) {
			addCriterion("create_time <", value, "createTime");
			return (Criteria) this;
		}

		public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
			addCriterion("create_time <=", value, "createTime");
			return (Criteria) this;
		}

		public Criteria andCreateTimeIn(List<Date> values) {
			addCriterion("create_time in", values, "createTime");
			return (Criteria) this;
		}

		public Criteria andCreateTimeNotIn(List<Date> values) {
			addCriterion("create_time not in", values, "createTime");
			return (Criteria) this;
		}

		public Criteria andCreateTimeBetween(Date value1, Date value2) {
			addCriterion("create_time between", value1, value2, "createTime");
			return (Criteria) this;
		}

		public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
			addCriterion("create_time not between", value1, value2,
					"createTime");
			return (Criteria) this;
		}

		public Criteria andIsReadIsNull() {
			addCriterion("is_read is null");
			return (Criteria) this;
		}

		public Criteria andIsReadIsNotNull() {
			addCriterion("is_read is not null");
			return (Criteria) this;
		}

		public Criteria andIsReadEqualTo(Boolean value) {
			addCriterion("is_read =", value, "isRead");
			return (Criteria) this;
		}

		public Criteria andIsReadNotEqualTo(Boolean value) {
			addCriterion("is_read <>", value, "isRead");
			return (Criteria) this;
		}

		public Criteria andIsReadGreaterThan(Boolean value) {
			addCriterion("is_read >", value, "isRead");
			return (Criteria) this;
		}

		public Criteria andIsReadGreaterThanOrEqualTo(Boolean value) {
			addCriterion("is_read >=", value, "isRead");
			return (Criteria) this;
		}

		public Criteria andIsReadLessThan(Boolean value) {
			addCriterion("is_read <", value, "isRead");
			return (Criteria) this;
		}

		public Criteria andIsReadLessThanOrEqualTo(Boolean value) {
			addCriterion("is_read <=", value, "isRead");
			return (Criteria) this;
		}

		public Criteria andIsReadIn(List<Boolean> values) {
			addCriterion("is_read in", values, "isRead");
			return (Criteria) this;
		}

		public Criteria andIsReadNotIn(List<Boolean> values) {
			addCriterion("is_read not in", values, "isRead");
			return (Criteria) this;
		}

		public Criteria andIsReadBetween(Boolean value1, Boolean value2) {
			addCriterion("is_read between", value1, value2, "isRead");
			return (Criteria) this;
		}

		public Criteria andIsReadNotBetween(Boolean value1, Boolean value2) {
			addCriterion("is_read not between", value1, value2, "isRead");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table station_mail
	 * @mbggenerated  Mon Sep 19 14:03:22 CST 2016
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

		protected Criterion(String condition, Object value, Object secondValue,
				String typeHandler) {
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

	/**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table station_mail
     *
     * @mbggenerated do_not_delete_during_merge Mon Sep 19 10:28:19 CST 2016
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }
}