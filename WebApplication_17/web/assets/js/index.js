$(document).ready(function() {
    // Xử lý animation khi trang tải
    $('.book-card').each(function(index) {
        $(this).css({
            'opacity': '0',
            'transform': 'translateY(20px)'
        });
        
        setTimeout(function() {
            $(this).animate({
                'opacity': '1'
            }, 300);
            $(this).css('transform', 'translateY(0)');
        }.bind(this), index * 50);
    });
    
    // Kiểm tra và xử lý khi hình ảnh không tải được
    $('img').on('error', function() {
        $(this).attr('src', 'assets/images/no-cover.png');
    });
    
    // Tự động đóng thông báo sau 5 giây
    setTimeout(function() {
        $('.message-container').slideUp(300);
    }, 5000);
});

// Hiển thị loading spinner khi chuyển trang
function showLoading() {
    if (!document.getElementById('loading-spinner')) {
        const spinner = document.createElement('div');
        spinner.id = 'loading-spinner';
        spinner.className = 'loading-spinner';
        spinner.innerHTML = '<div class="spinner"></div>';
        document.body.appendChild(spinner);
    }
    document.getElementById('loading-spinner').style.display = 'flex';
}

// Thêm sự kiện loading cho các liên kết phân trang
document.addEventListener('DOMContentLoaded', function() {
    const paginationLinks = document.querySelectorAll('.pagination-btn');
    paginationLinks.forEach(link => {
        link.addEventListener('click', showLoading);
    });
    
    // Thêm sự kiện loading cho form tìm kiếm
    const searchForm = document.querySelector('.search-container form');
    if (searchForm) {
        searchForm.addEventListener('submit', showLoading);
    }
});