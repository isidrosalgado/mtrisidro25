view: orders {
  sql_table_name: `orders.orders` ;;
  drill_fields: [id]

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
    html: <a href="/embed/dashboards/5?Completed+Date=2025%2F01%2F01+to+2025%2F01%2F22">Link</a> ;;
    #link: {
    #  label: "Dash"
    #  url: "/dashboards/5?Completed+Date=2025%2F01%2F01+to+2025%2F01%2F22"
    #}
  }

  measure: count_link {
    type: count
    link: {
      label: "Dash"
     url: "/embed/dashboards/5?Completed+Date=2025%2F01%2F01+to+2025%2F01%2F22"
    }
  }
}
