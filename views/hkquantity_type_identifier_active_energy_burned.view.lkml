view: hkquantity_type_identifier_active_energy_burned {
  sql_table_name: `mylooker.HKQuantityTypeIdentifierActiveEnergyBurned`
    ;;

  dimension: pk {
    hidden: no
    sql: CONCAT(${startdate_raw}, "-to-", ${enddate_raw}) ;;
    primary_key: yes
  }

  dimension_group: creationdate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.creationdate ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension_group: enddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.enddate ;;
  }

  dimension: hkmetadata_key_sync_identifier {
    type: string
    sql: ${TABLE}.HKMetadataKeySyncIdentifier ;;
  }

  dimension: hkmetadata_key_sync_version {
    type: string
    sql: ${TABLE}.HKMetadataKeySyncVersion ;;
  }

  dimension: sourcename {
    type: string
    sql: ${TABLE}.sourcename ;;
  }

  dimension: sourceversion {
    type: string
    sql: ${TABLE}.sourceversion ;;
  }

  dimension: display_hour {
    type: string
    sql: ${startdate_hour_of_day} ;;
    html:
    {% assign value = value | times: 1 %}
    {% if value > 12 %}
    {{ value | minus: 12 }}PM
    {% else %}
    {{ value }}AM
    {% endif %} ;;
  }

  dimension_group: startdate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      hour_of_day,
      hour
    ]
    sql: ${TABLE}.startdate ;;
  }

  dimension_group: collection_duration {
    type: duration
    intervals: [second, minute, hour]
    sql_start: ${startdate_raw} ;;
    sql_end: ${enddate_raw} ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [record*]
  }

  measure: average_burned {
    type: average
    sql: ${value} ;;
    drill_fields: [record*]
    value_format: "#.## kcal"
  }

  measure: total_burned {
    type: sum
    sql: ${value} ;;
    drill_fields: [record*]
    value_format: "#.## kcal"
  }


  set: record {
    fields: [type, sourcename, sourceversion, device, unit, creationdate_raw, startdate_raw, enddate_raw, value, hkmetadata_key_sync_version, hkmetadata_key_sync_identifier]
  }
}
