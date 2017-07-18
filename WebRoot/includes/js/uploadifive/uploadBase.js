var CUpload = {
    tbtype: '',
    gcid: '',
    Assign: function (gcid) {
        CUpload.gcid = gcid;
    },
    Initialize: function (type) {
    	CUpload.InitializeHTML5(type);
    },
    Upload: function () {
    	CUpload.UploadHTML5();
    },
    InitializeHTML5: function (type) {
        CUpload.tbtype = type;
        $("#file_upload").uploadifive({
            'fileObjName': 'fileData',
            'auto': false,
            'buttonText': "选择文件",
            'buttonClass': 'btn btn-primary',
            'height': '30',
            'width': '180',
            'removeCompleted': true,
            'uploadScript': 'upload.action',
            'queueID': 'uploadfileQueue',
            'multi': true,
            'onUploadComplete': function (file, data) {
                var jsonData = JSON.parse(data);
                var newrow = GetNewAttachRow(jsonData.gcAttach);
				$('#attTable').append(newrow);
            }
            //,'formData': { 'entityID': 11,'entityType':'some' }            <div class="btn btn-danger" onclick="DelAtt('a', 1)">abc</div>
            , 'onError': function (errorType) {
                CUpload.entityID
                switch (errorType) {
                    case 'QUEUE_LIMIT_EXCEEDED':
                        alert("上传的文件数量超限");
                        break;
                    case 'FILE_SIZE_LIMIT_EXCEEDED':
                        alert("文件大小超限");
                        break;
                    case 'FORBIDDEN_FILE_TYPE':
                        alert("文件类型不允许");
                        break;
                    case '404_FILE_NOT_FOUND':
                        alert("文件未找到！");
                        break;
                    default:
                        alert("未知错误");
                        break;
                }
            }
        });
    },
    UploadHTML5: function () {
        $('#file_upload').data('uploadifive').settings.formData = { 'gcid': CUpload.gcid, 'tbtype': CUpload.tbtype };
        $('#file_upload').uploadifive('upload');
    }
};
function UploadAttachment() {
    var eID = $("#gcid").val();
    if (eID) {
        CUpload.Assign(eID);
        CUpload.Upload();
    }
    else {
        alert("首先保存数据!");
    }
}
function DelAtt(type, id) {
    var tb = document.getElementById("attTable");//表格
    var tr = document.getElementById(id).parentNode.parentNode;//tr
    var index = tr.rowIndex;
    tb.deleteRow(index);
    //删除附件
    $.ajax({
        type: "POST",
        url: "/FileUpload/Delete",
        data: "{fileType:'" + type + "',fileID:" + id + "}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var va = data.d;
        },
        error: function (XMLResponse) {
            alert(XMLResponse.responseText);
        }
    });
}