import json
def read_file_content():
    fread=open('C:/Users/SUMANTA/PycharmProjects/RobotFrameWorkAutomation/InputData.json','r')
    fileData=fread.read()
    json_content= json.loads(fileData)
    return json_content

#data=read_file_content()
#print(data)
