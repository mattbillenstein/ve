
# subshell it real good -- install airflow in its own virtualenv

AIRFLOW_VERSION="1.10.2"

(
rm -fR $VENV/opt/airflow

$VENV/bin/virtualenv $VENV/opt/airflow
source $VENV/opt/airflow/bin/activate

export AIRFLOW_GPL_UNIDECODE=1

$VENV/opt/airflow/bin/pip install "apache-airflow[s3, postgres, slack, crypto, celery, async]==$AIRFLOW_VERSION"
)
