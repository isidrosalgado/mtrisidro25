view: users {
  sql_table_name: `orders.users` ;;
  drill_fields: [id]

  dimension: id {
    label: "rash"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    label: "cash"
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    label: "tash"
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    label: "hash"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
  measure: count_link {
    type: count
    link: {
      label: "Dash"
      url: "https://gcps250.cloud.looker.com/dashboards/17"
    }
    }
}
