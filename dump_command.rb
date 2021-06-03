pg_dump teachapp_development -c | \
  PGPASSWORD="c75f4b8f36eada0a20d0556ca24ca5cf2ae34aac5b2facf22919d328319e7dff" \
  psql -h ec2-54-73-58-75.eu-west-1.compute.amazonaws.com \
  -d d5jk8opob7efdd \
  -U ragdbwquwdumwb

