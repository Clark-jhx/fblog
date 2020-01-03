package com.clark.fblog.bean;

import java.util.List;

public class NewComments_ {

    private List<NewCommentsBean> NewComments;

    public List<NewCommentsBean> getNewComments() {
        return NewComments;
    }

    public void setNewComments(List<NewCommentsBean> NewComments) {
        this.NewComments = NewComments;
    }

    public static class NewCommentsBean {
        /**
         * CommentID : 411092
         * ContentID : 0
         * CommentContent : zan
         * UserGuid : d2ed414d-2ea4-e611-845c-ac853d9f53ac
         * UserId : 1058512
         * UserName : hellotim
         * FaceUrl : https://pic.cnblogs.com/face/1058512/20191224142237.png
         * Floor : 1
         * DateAdded : 2018-01-16T16:01:34.62
         * AgreeCount : 0
         * AntiCount : 0
         * ParentCommentID : 0
         * ParentComment : null
         */

        private int CommentID;
        private int ContentID;
        private String CommentContent;
        private String UserGuid;
        private int UserId;
        private String UserName;
        private String FaceUrl;
        private int Floor;
        private String DateAdded;
        private int AgreeCount;
        private int AntiCount;
        private int ParentCommentID;
        private Object ParentComment;

        public int getCommentID() {
            return CommentID;
        }

        public void setCommentID(int CommentID) {
            this.CommentID = CommentID;
        }

        public int getContentID() {
            return ContentID;
        }

        public void setContentID(int ContentID) {
            this.ContentID = ContentID;
        }

        public String getCommentContent() {
            return CommentContent;
        }

        public void setCommentContent(String CommentContent) {
            this.CommentContent = CommentContent;
        }

        public String getUserGuid() {
            return UserGuid;
        }

        public void setUserGuid(String UserGuid) {
            this.UserGuid = UserGuid;
        }

        public int getUserId() {
            return UserId;
        }

        public void setUserId(int UserId) {
            this.UserId = UserId;
        }

        public String getUserName() {
            return UserName;
        }

        public void setUserName(String UserName) {
            this.UserName = UserName;
        }

        public String getFaceUrl() {
            return FaceUrl;
        }

        public void setFaceUrl(String FaceUrl) {
            this.FaceUrl = FaceUrl;
        }

        public int getFloor() {
            return Floor;
        }

        public void setFloor(int Floor) {
            this.Floor = Floor;
        }

        public String getDateAdded() {
            return DateAdded;
        }

        public void setDateAdded(String DateAdded) {
            this.DateAdded = DateAdded;
        }

        public int getAgreeCount() {
            return AgreeCount;
        }

        public void setAgreeCount(int AgreeCount) {
            this.AgreeCount = AgreeCount;
        }

        public int getAntiCount() {
            return AntiCount;
        }

        public void setAntiCount(int AntiCount) {
            this.AntiCount = AntiCount;
        }

        public int getParentCommentID() {
            return ParentCommentID;
        }

        public void setParentCommentID(int ParentCommentID) {
            this.ParentCommentID = ParentCommentID;
        }

        public Object getParentComment() {
            return ParentComment;
        }

        public void setParentComment(Object ParentComment) {
            this.ParentComment = ParentComment;
        }
    }
}
