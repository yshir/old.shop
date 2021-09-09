#!/bin/bash

TMP_FILE=functions.yml.tmp
ACT_FILE=functions.yml

echo -n > $TMP_FILE

for r in routes/*; do
  if [ -d "$r" ]; then
    r=$(basename "$r")

    s=(${r/-/ })
    method=${s[0]}
    path=${s[1]}

    if [ ! "$method" = "get" ] && \
       [ ! "$method" = "post" ] && \
       [ ! "$method" = "put" ] && \
       [ ! "$method" = "delete" ]; then
      echo "method must be {get,post,put,delete}, but got '$method'"
      rm $TMP_FILE
      exit 1
    fi

    if [ -z "$path" ]; then
      echo "path must not be empty"
      rm $TMP_FILE
      exit 1
    fi

    # hello:
    #   handler: bin/get-hello
    #   name: ${self:service}-${self:provider.stage}--get-hello
    #   events:
    #     - httpApi:
    #         path: /hello
    #         method: get
    echo "$path:"                                               >> $TMP_FILE
    echo "  handler: bin/$r"                                    >> $TMP_FILE
    echo "  name: \${self:service}-\${self:provider.stage}--$r" >> $TMP_FILE
    echo "  events:"                                            >> $TMP_FILE
    echo "    - httpApi:"                                       >> $TMP_FILE
    echo "        path: /$path"                                 >> $TMP_FILE
    echo "        method: $method"                              >> $TMP_FILE
  fi
done

cp $TMP_FILE $ACT_FILE
rm $TMP_FILE
