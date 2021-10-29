#!/usr/bin/env bash
#使用飞书卡片进行推送


action=$1
url=$2

case $action in 
"success")
    CLORL=turquoise
;;
"abort")
    CLORL=grey
;;
"failed")
    CLORL=red
;;
*)
    CLORL=purple
esac



JSON_BODY=$(cat <<EOF
{"msg_type": "interactive","card":{"config":{"wide_screen_mode":true},"elements":[{"tag":"div","text":{"content":"**【任务名称】** ${JOB_NAME}\n**【任务版本】** ${BUILD_ID}\n**【发布分支】** ${BRANCH}   \n**【提交版本】** ${GIT_COMMIT}\n\n","tag":"lark_md"}},{"actions":[{"tag":"button","text":{"content":"任务链接","tag":"plain_text"},"type":"primary","url":"${JOB_URL}","value":{"key":"value"}},{"tag":"button","text":{"content":"change记录","tag":"plain_text"},"type":"primary","url":"${BUILD_URL}","value":{"key":"value"}}],"tag":"action"},{"tag":"hr"},{"elements":[{"content":"[来自Cider-Jenkins通知]","tag":"lark_md"}],"tag":"note"}],"header":{"template":"${CLORL}","title":{"content":"【Jenkins发布通知】","tag":"plain_text"}}}} 
EOF
)


curl -si \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-X POST --data "$JSON_BODY" \
${url}
