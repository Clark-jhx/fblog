package com.clark.fblog.bean;

import java.util.List;

public class News_ {
    private List<New_> News;

    public List<New_> getNews() {
        return News;
    }

    public void setNews(List<New_> News) {
        this.News = News;
    }

    public static class New_ {
        /**
         * Id : 652961
         * Title : 华为首个智能无人售货店开业，葫芦里卖的什么药？
         * Summary : 作者：刘伟 雷锋网(公众号：雷锋网)消息 2020 年的头一天，一家华为授权的智能无人售货店在武汉正式开业。据了解，这家无人售货店位于光谷新发展国际中心，外形酷似一个环形的飞碟舱。通过透明的舱壁可以看到里面整齐罗列的商品。 与其说这个无人售货店是一个店，倒不如说是一个大型的自动售货机。因为它通体封闭
         * TopicId : 188
         * TopicIcon : https://img2018.cnblogs.com/news_topic/20190730153501178-1904121953.png
         * ViewCount : 244
         * CommentCount : 1
         * DiggCount : 0
         * DateAdded : 2020-01-02T17:31:40.997
         */

        private int Id;
        private String Title;
        private String Summary;
        private int TopicId;
        private String TopicIcon;
        private int ViewCount;
        private int CommentCount;
        private int DiggCount;
        private String DateAdded;

        public int getId() {
            return Id;
        }

        public void setId(int Id) {
            this.Id = Id;
        }

        public String getTitle() {
            return Title;
        }

        public void setTitle(String Title) {
            this.Title = Title;
        }

        public String getSummary() {
            return Summary;
        }

        public void setSummary(String Summary) {
            this.Summary = Summary;
        }

        public int getTopicId() {
            return TopicId;
        }

        public void setTopicId(int TopicId) {
            this.TopicId = TopicId;
        }

        public String getTopicIcon() {
            return TopicIcon;
        }

        public void setTopicIcon(String TopicIcon) {
            this.TopicIcon = TopicIcon;
        }

        public int getViewCount() {
            return ViewCount;
        }

        public void setViewCount(int ViewCount) {
            this.ViewCount = ViewCount;
        }

        public int getCommentCount() {
            return CommentCount;
        }

        public void setCommentCount(int CommentCount) {
            this.CommentCount = CommentCount;
        }

        public int getDiggCount() {
            return DiggCount;
        }

        public void setDiggCount(int DiggCount) {
            this.DiggCount = DiggCount;
        }

        public String getDateAdded() {
            return DateAdded;
        }

        public void setDateAdded(String DateAdded) {
            this.DateAdded = DateAdded;
        }
    }
}
