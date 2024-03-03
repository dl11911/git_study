$(document).ready(function() {
    $('#boardUpdateFormBtn').on('click', function(e) {
        e.preventDefault();

        // 필요한 유효성 검사를 추가합니다.
        var subject = $('#subject').val().trim();
        var content = $('#content').val().trim();

        if (subject === "" || content === "") {
            alert('제목과 내용을 모두 입력해주세요.');
            return;
        }

        // 유효성 검사를 통과한 후 서버로 데이터를 전송합니다.
        $.ajax({
            type: 'POST',
            url: '/projectMVC/board/update.do',
            data: {
                seq: $('#seq').val(),
                subject: subject,
                content: content
            },
            success: function(data) {
                if (data.result === 'success') {
                    alert('글이 성공적으로 수정되었습니다.');
                    location.href = '/projectMVC/board/boardList.do?pg=1';
                } else {
                    alert('글 수정에 실패하였습니다. 다시 시도해주세요.');
                }
            },
            error: function(e) {
                console.error(e);
            }
        });
    });
});
