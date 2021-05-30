from django.urls import path
from . import views

urlpatterns = [
    path("visitorC/", views.v_create, name="vC"),
    path("visitorR/", views.v_read, name="vR"),
    path("visitorU/", views.v_update, name="vU"),
    path("visitorD/", views.v_delete, name="vD"),
    path("replyC/", views.reply_create, name="rC"),#댓글생성
    path("replyR/", views.reply_read, name="rR"),
    path("search1/<name>", views.search1, name="search1"), #작성자 이름 서치
    path("search2/<content>", views.search2, name="search2"), #컨텐츠 서리
]