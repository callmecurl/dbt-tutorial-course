{% snapshot snapshot__distribution_centers %}

{{
    config(
      target_schema='dbt_snapshots',
      unique_key='id',
      strategy='check',
      check_cols=['name', 'latitude', 'longitude']
    )
}}

SELECT * FROM {{ source('dbt_curly', 'seed_distribution_centers_new') }}

{% endsnapshot %}