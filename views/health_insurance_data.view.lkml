# The name of this view in Looker is "Health Insurance Data"
view: health_insurance_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  # sql_table_name: `test_insurance_data.health-insurance-mini` ;;
  derived_table: {
    datagroup_trigger: looker_actions_api_test_default_datagroup
    sql: SELECT * FROM `test_insurance_data.health-insurance-mini` ;;
    publish_as_db_view: yes
  }

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  dimension: bmi {
    type: number
    sql: ${TABLE}.bmi ;;
  }

  dimension: charges {
    type: number
    sql: ${TABLE}.charges ;;
  }

  dimension: children {
    type: number
    sql: ${TABLE}.children ;;
  }

  dimension: coverage_level {
    type: string
    sql: ${TABLE}.coverage_level ;;
  }

  dimension: exercise_frequency {
    type: string
    sql: ${TABLE}.exercise_frequency ;;
  }

  dimension: family_medical_history {
    type: string
    sql: ${TABLE}.family_medical_history ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: medical_history {
    type: string
    sql: ${TABLE}.medical_history ;;
  }

  dimension: occupation {
    type: string
    sql: ${TABLE}.occupation ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: smoker {
    type: yesno
    sql: ${TABLE}.smoker ;;
  }
  measure: count {
    type: count
  }

  measure: total_charges {
    type: sum
    sql: ${TABLE}.charges ;;
  }

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }
  measure: test_button {
    type: string
    sql: '' ;;
    html:
      {%- assign o = _filters["health_insurance_data.occupation"] | urlencode -%}
      {%- assign ef = _filters["health_insurance_data.exercise_frequency"] | urlencode -%}
      {%- assign loc = _filters["health_insurance_data.region"] | urlencode -%}
      {%- assign cl = _filters["health_insurance_data.coverage_level"] | urlencode -%}
      <a href="http://localhost:3001/generate_pdf?o={{ o }}&ef={{ ef }}&loc={{ loc }}&cl={{ cl }}" style="font-size:16px" target="_new">Download As PDF</a>;;
  }
  measure: dump_table {
    type: string
    sql: '' ;;
    html:
      {%- assign o = _filters["health_insurance_data.occupation"] | urlencode -%}
      {%- assign ef = _filters["health_insurance_data.exercise_frequency"] | urlencode -%}
      {%- assign loc = _filters["health_insurance_data.region"] | urlencode -%}
      {%- assign cl = _filters["health_insurance_data.coverage_level"] | urlencode -%}
      <a href="http://localhost:3001/dump_table_to_pdf" style="font-size:16px" target="_new">Dump Table</a>;;
  }
}
