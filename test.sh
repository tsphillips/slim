#!/bin/bash

# Copyright (c) 2015 Thomas S. Phillips.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

CMD=./slim
DB=slim-test.sqlite3

touch ${DB}
rm ${DB}

ID=`${CMD} -w --db ${DB} \
--id 1000`

ID=`${CMD} -w --db ${DB} \
--id 2000 \
--name ERROR`

ID=`${CMD} -w --db ${DB} \
--id 3000 \
--name ERROR \
--date-discovered 2015-01-01`

ID=`${CMD} -w --db ${DB} \
--id 4000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56`

ID=`${CMD} -w --db ${DB} \
--id 5000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02`

ID=`${CMD} -w --db ${DB} \
--id 6000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02 \
--code-review-date 2015-01-03`

ID=`${CMD} -w --db ${DB} \
--id 7000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02 \
--code-review-date 2015-01-03 \
--integration-test-date 2015-01-04`

ID=`${CMD} -w --db ${DB} \
--id 8000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02 \
--code-review-date 2015-01-03 \
--integration-test-date 2015-01-04 \
--system-test-date 2015-01-05`

ID=`${CMD} -w --db ${DB} \
--id 9000 \
--name ERROR \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02 \
--code-review-date 2015-01-03 \
--integration-test-date 2015-01-04 \
--system-test-date 2015-01-05 \
--version-deployed 65.43.21`

IDU=`${CMD} -w --db ${DB} \
--name "ERROR" \
--date-discovered 2015-01-01 \
--version-identified 12.34.56 \
--unit-test-date 2015-01-02 \
--code-review-date 2015-01-03 \
--integration-test-date 2015-01-04 \
--system-test-date 2015-01-05 \
--version-deployed 65.43.21`

ID=`${CMD} -m --db ${DB} \
--id 1000 \
--name 1000`

ID=`${CMD} -m --db ${DB} \
--id 2000 \
--name 2000`

ID=`${CMD} -m --db ${DB} \
--id 3000 \
--name 3000`

ID=`${CMD} -m --db ${DB} \
--id 4000 \
--name 4000`

ID=`${CMD} -m --db ${DB} \
--id 5000 \
--name 5000`

ID=`${CMD} -m --db ${DB} \
--id 6000 \
--name 6000`

ID=`${CMD} -m --db ${DB} \
--id 7000 \
--name 7000`

ID=`${CMD} -m --db ${DB} \
--id 8000 \
--name 8000`

ID=`${CMD} -m --db ${DB} \
--id 9000 \
--name 9000`

ID=`${CMD} -m --db ${DB} \
--id ${IDU} \
--name UNIQUE`

if [ "${ID}" != "${IDU}" ] ; then echo "ERROR: ID != IDU, unique id generation is broken" ; echo "ERROR: ${ID} != ${IDU}"; exit; fi

CNT=`${CMD} -r --db ${DB} | wc -w`

if [ ${CNT} != 72 ] ; then ${CMD} -r ; echo "ERROR: malformed output; manually inspect the database" ; exit; fi

echo "Everything looks okay to me.  Ship it!"

rm ${DB}
