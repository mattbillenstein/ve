
# subshell it real good -- install airflow in its own virtualenv

AIRFLOW_VERSION="2.3.2"

(
rm -fR $VENV/opt/airflow

$VENV/bin/python3 -m venv $VENV/opt/airflow
source $VENV/opt/airflow/bin/activate

$VENV/opt/airflow/bin/pip install "apache-airflow[s3, postgres, slack, crypto, async]==$AIRFLOW_VERSION"
)
