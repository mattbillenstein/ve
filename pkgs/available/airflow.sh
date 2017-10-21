
# subshell it real good -- install airflow in its own virtualenv

AIRFLOW_VERSION="1.7.1.3"

(
rm -fR $VENV/opt/airflow

$VENV/bin/virtualenv $VENV/opt/airflow
source $VENV/opt/airflow/bin/activate

$VENV/opt/airflow/bin/pip install 'airflow[s3, postgres, slack, crypto, celery, async]==1.7.1.3'
)
