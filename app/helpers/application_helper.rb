module ApplicationHelper
  def hide_notice_after(seconds)
    javascript_tag do
      "setTimeout(function() {
        document.getElementById('notice').classList.add('hiddn');
        setTimeout(function() {
          document.getElementById('notice').style.display = 'none';
        }, 600);
      }, #{seconds * 500});".html_safe
    end
  end

  def hide_alert_after(seconds)
    javascript_tag do
      "setTimeout(function() {
        document.getElementById('alert').classList.add('hiddn');
        setTimeout(function() {
          document.getElementById('alert').style.display = 'none';
        }, 600);
      }, #{seconds * 500});".html_safe
    end
  end
end
