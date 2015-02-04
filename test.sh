#!/bin/bash

CMD=./slim
DB=slim.sqlite3

rm ${DB}

# if o in ('--id', '--issue-id'):
# if o in ('--name'):
# if o in ('--date-discovered'):
# if o in ('--version-identified'):
# if o in ('--unit-test-date'):
# if o in ('--code-review-date'):
# if o in ('--integration-test-date', '--alpha-test-date'):
# if o in ('--system-test-date', '--beta-test-date'):
# if o in ('--version-deployed'):

ID=`${CMD} -w \
--id 1000`

ID=`${CMD} -w \
--id 2000 \
--name ERROR`

ID=`${CMD} -w \
--id 3000 \
--name ERROR \
--date-discovered 2015-01-01`

ID=`${CMD} -w \
--id 4000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56`

ID=`${CMD} -w \
--id 5000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02`

ID=`${CMD} -w \
--id 6000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02 \
--code-review-date 2015-01-03`

ID=`${CMD} -w \
--id 7000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02 \
--code-review-date 2015-01-03 \
--integration-test-date 2015-01-04`

ID=`${CMD} -w \
--id 8000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02 \
--code-review-date 2015-01-03 \
--integration-test-date 2015-01-04 \
--system-test-date 2015-01-05`

ID=`${CMD} -w \
--id 9000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02 \
--code-review-date 2015-01-03 \
--integration-test-date 2015-01-04 \
--system-test-date 2015-01-05 \
--version-deployed 65.43.21`

IDU=`${CMD} -w \
--name "ERROR" \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02 \
--code-review-date 2015-01-03 \
--integration-test-date 2015-01-04 \
--system-test-date 2015-01-05 \
--version-deployed 65.43.21`

ID=`${CMD} -m \
--id 1000 \
--name 1000`

ID=`${CMD} -m \
--id 2000 \
--name 2000`

ID=`${CMD} -m \
--id 3000 \
--name 3000`

ID=`${CMD} -m \
--id 4000 \
--name 4000`

ID=`${CMD} -m \
--id 5000 \
--name 5000`

ID=`${CMD} -m \
--id 6000 \
--name 6000`

ID=`${CMD} -m \
--id 7000 \
--name 7000`

ID=`${CMD} -m \
--id 8000 \
--name 8000`

ID=`${CMD} -m \
--id 9000 \
--name 9000`

ID=`${CMD} -m \
--id ${IDU} \
--name UNIQUE`

if [ ${ID} != ${IDU} ] ; then echo "ERROR: ID != IDU, unique id generation is broken" ; exit; fi

CNT=`${CMD} -r | wc -w`

if [ ${CNT} != 72 ] ; then ${CMD} -r ; echo "ERROR: malformed output; manually inspect the database" ; exit; fi

echo "Everything looks okay to me.  Ship it!"
