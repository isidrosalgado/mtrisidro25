view: orders {
  sql_table_name: `orders.orders` ;;
  drill_fields: [id]

  parameter: user_input_period {
    view_label: "Period over Period Analysis"
    label: "Choose Timeframe for {{_view._name}} Date"
    description: "Choose from aggregations by day, week, month, etc. This changes the dates in '{{_view._name}} Period.'"
    type: unquoted
    allowed_value: {
      label: "Day"
      value: "day"
    }
  }

  dimension: date {
    sql:
    {% if user_input_period._parameter_value == "day" %}
    ${created_date}
     {% elsif user_input_period._parameter_value == "month" %}
    ${created_month}
    {% else %}
    ${created_date}
    {% endif %};;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: created_at {
    type: time
    description: "for linna test"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at_date ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count_html {
    type: count
    html: <a href="/embed/dashboards/5?Completed+Date=2025%2F01%2F01+to+2025%2F01%2F22">Link</a>
          <a href="https://gcpl2420.cloud.looker.com/embed/dashboards/225">Link2</a>;;

  }

  measure: count_link {
    type: count
    link: {
      label: "Dash"
     url: "/embed/dashboards/5?Completed+Date=2025%2F01%2F01+to+2025%2F01%2F22"
    }
    link: {
      label: "Dash2"
      url: "https://gcpl2420.cloud.looker.com/embed/dashboards/225"
    }
  }
}
