view: hkquantity_type_identifier_active_energy_burned {
  sql_table_name: `mylooker.HKQuantityTypeIdentifierActiveEnergyBurned`
    ;;

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

  dimension_group: startdate {
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
    sql: ${TABLE}.startdate ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }

  measure: value {
    type: sum
    sql: ${TABLE}.value ;;
    drill_fields: [record*]
  }

  measure: count {
    type: count
    drill_fields: [record*]
  }

  set: record {
    fields: [type, sourcename, sourceversion, device, unit, creationdate_raw, startdate_raw, enddate_raw, value, hkmetadata_key_sync_version, hkmetadata_key_sync_identifier]
  }
}
