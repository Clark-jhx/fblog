package com.clark.fblog.bean;

import java.util.List;

/**
 * 新闻列表
 */
public class News {

    /**
     * feed : {"entry":[{"summary":{"Content":"作者：骑士 IT 之家 11 月 26 日消息 长期以来，全球 IPv4 地址耗尽令人担忧，今天这一时刻终于来临\u2014\u2014所有 43 亿个 IPv4 地址已分配完毕，这意味着没有更多的 IPv4 地址可以分配给 ISP 和其他大型网络基础设施提供商。 该过程自 80 年代以来就已预见到，顶级地址实际上已经","type":"text"},"comments":35,"link":{"rel":"alternate","href":"http://news.cnblogs.com/n/650034/"},"topic":"","topicIcon":"","id":650034,"published":"2019-11-26T08:22:45+08:00","sourceName":"IT之家","title":{"Content":"全球IPv4地址正式耗尽！","type":"text"},"diggs":12,"updated":"2019-11-29T03:20:07Z","views":6015},{"summary":{"Content":"据梨视频报道，近日，沈阳理工大学一名通信工程专业大二学生小梁在二手平台购买手机时被骗 6000 元。小梁在\u201c闲鱼\u201d上与卖家聊天后，对方以支付宝被冻结为由，要求加微信用\u201c转转\u201d交易。加了微信后，小梁点击对方发来的链接，付了款之后才发现是骗局。对方做了一个假的链接，虽然看起来和转转是一摸一样的，但支付后","type":"text"},"comments":23,"link":{"rel":"alternate","href":"http://news.cnblogs.com/n/650114/"},"topic":"","topicIcon":"","id":650114,"published":"2019-11-27T14:52:01+08:00","sourceName":"站长之家","title":{"Content":"买手机被骗6000元 理工男网购被骗后攻破骗子后台","type":"text"},"diggs":22,"updated":"2019-11-29T03:20:07Z","views":5010}],"xmlns":"http://www.w3.org/2005/Atom","link":{"href":"http://news.cnblogs.com/"},"id":"uuid:c432ad4a-9f45-4187-b4c9-1384f41ecd7f;id=4280","title":{"Content":"博客园新闻频道","type":"text"},"updated":"2019-11-29T03:20:07Z"}
     */

    private FeedBean feed;

    public FeedBean getFeed() {
        return feed;
    }

    public void setFeed(FeedBean feed) {
        this.feed = feed;
    }

    public static class FeedBean {
        /**
         * entry : [{"summary":{"Content":"作者：骑士 IT 之家 11 月 26 日消息 长期以来，全球 IPv4 地址耗尽令人担忧，今天这一时刻终于来临\u2014\u2014所有 43 亿个 IPv4 地址已分配完毕，这意味着没有更多的 IPv4 地址可以分配给 ISP 和其他大型网络基础设施提供商。 该过程自 80 年代以来就已预见到，顶级地址实际上已经","type":"text"},"comments":35,"link":{"rel":"alternate","href":"http://news.cnblogs.com/n/650034/"},"topic":"","topicIcon":"","id":650034,"published":"2019-11-26T08:22:45+08:00","sourceName":"IT之家","title":{"Content":"全球IPv4地址正式耗尽！","type":"text"},"diggs":12,"updated":"2019-11-29T03:20:07Z","views":6015},{"summary":{"Content":"据梨视频报道，近日，沈阳理工大学一名通信工程专业大二学生小梁在二手平台购买手机时被骗 6000 元。小梁在\u201c闲鱼\u201d上与卖家聊天后，对方以支付宝被冻结为由，要求加微信用\u201c转转\u201d交易。加了微信后，小梁点击对方发来的链接，付了款之后才发现是骗局。对方做了一个假的链接，虽然看起来和转转是一摸一样的，但支付后","type":"text"},"comments":23,"link":{"rel":"alternate","href":"http://news.cnblogs.com/n/650114/"},"topic":"","topicIcon":"","id":650114,"published":"2019-11-27T14:52:01+08:00","sourceName":"站长之家","title":{"Content":"买手机被骗6000元 理工男网购被骗后攻破骗子后台","type":"text"},"diggs":22,"updated":"2019-11-29T03:20:07Z","views":5010}]
         * xmlns : http://www.w3.org/2005/Atom
         * link : {"href":"http://news.cnblogs.com/"}
         * id : uuid:c432ad4a-9f45-4187-b4c9-1384f41ecd7f;id=4280
         * title : {"Content":"博客园新闻频道","type":"text"}
         * updated : 2019-11-29T03:20:07Z
         */

        private String xmlns;
        private LinkBean link;
        private String id;
        private TitleBean title;
        private String updated;
        private List<EntryBean> entry;

        public String getXmlns() {
            return xmlns;
        }

        public void setXmlns(String xmlns) {
            this.xmlns = xmlns;
        }

        public LinkBean getLink() {
            return link;
        }

        public void setLink(LinkBean link) {
            this.link = link;
        }

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public TitleBean getTitle() {
            return title;
        }

        public void setTitle(TitleBean title) {
            this.title = title;
        }

        public String getUpdated() {
            return updated;
        }

        public void setUpdated(String updated) {
            this.updated = updated;
        }

        public List<EntryBean> getEntry() {
            return entry;
        }

        public void setEntry(List<EntryBean> entry) {
            this.entry = entry;
        }

        public static class LinkBean {
            /**
             * href : http://news.cnblogs.com/
             */

            private String href;

            public String getHref() {
                return href;
            }

            public void setHref(String href) {
                this.href = href;
            }
        }

        public static class TitleBean {
            /**
             * Content : 博客园新闻频道
             * type : text
             */

            private String Content;
            private String type;

            public String getContent() {
                return Content;
            }

            public void setContent(String Content) {
                this.Content = Content;
            }

            public String getType() {
                return type;
            }

            public void setType(String type) {
                this.type = type;
            }
        }

        public static class EntryBean {
            /**
             * summary : {"Content":"作者：骑士 IT 之家 11 月 26 日消息 长期以来，全球 IPv4 地址耗尽令人担忧，今天这一时刻终于来临\u2014\u2014所有 43 亿个 IPv4 地址已分配完毕，这意味着没有更多的 IPv4 地址可以分配给 ISP 和其他大型网络基础设施提供商。 该过程自 80 年代以来就已预见到，顶级地址实际上已经","type":"text"}
             * comments : 35
             * link : {"rel":"alternate","href":"http://news.cnblogs.com/n/650034/"}
             * topic :
             * topicIcon :
             * id : 650034
             * published : 2019-11-26T08:22:45+08:00
             * sourceName : IT之家
             * title : {"Content":"全球IPv4地址正式耗尽！","type":"text"}
             * diggs : 12
             * updated : 2019-11-29T03:20:07Z
             * views : 6015
             */

            private SummaryBean summary;
            private int comments;
            private LinkBeanX link;
            private String topic;
            private String topicIcon;
            private int id;
            private String published;
            private String sourceName;
            private TitleBeanX title;
            private int diggs;
            private String updated;
            private int views;

            public SummaryBean getSummary() {
                return summary;
            }

            public void setSummary(SummaryBean summary) {
                this.summary = summary;
            }

            public int getComments() {
                return comments;
            }

            public void setComments(int comments) {
                this.comments = comments;
            }

            public LinkBeanX getLink() {
                return link;
            }

            public void setLink(LinkBeanX link) {
                this.link = link;
            }

            public String getTopic() {
                return topic;
            }

            public void setTopic(String topic) {
                this.topic = topic;
            }

            public String getTopicIcon() {
                return topicIcon;
            }

            public void setTopicIcon(String topicIcon) {
                this.topicIcon = topicIcon;
            }

            public int getId() {
                return id;
            }

            public void setId(int id) {
                this.id = id;
            }

            public String getPublished() {
                return published;
            }

            public void setPublished(String published) {
                this.published = published;
            }

            public String getSourceName() {
                return sourceName;
            }

            public void setSourceName(String sourceName) {
                this.sourceName = sourceName;
            }

            public TitleBeanX getTitle() {
                return title;
            }

            public void setTitle(TitleBeanX title) {
                this.title = title;
            }

            public int getDiggs() {
                return diggs;
            }

            public void setDiggs(int diggs) {
                this.diggs = diggs;
            }

            public String getUpdated() {
                return updated;
            }

            public void setUpdated(String updated) {
                this.updated = updated;
            }

            public int getViews() {
                return views;
            }

            public void setViews(int views) {
                this.views = views;
            }

            public static class SummaryBean {
                /**
                 * Content : 作者：骑士 IT 之家 11 月 26 日消息 长期以来，全球 IPv4 地址耗尽令人担忧，今天这一时刻终于来临——所有 43 亿个 IPv4 地址已分配完毕，这意味着没有更多的 IPv4 地址可以分配给 ISP 和其他大型网络基础设施提供商。 该过程自 80 年代以来就已预见到，顶级地址实际上已经
                 * type : text
                 */

                private String Content;
                private String type;

                public String getContent() {
                    return Content;
                }

                public void setContent(String Content) {
                    this.Content = Content;
                }

                public String getType() {
                    return type;
                }

                public void setType(String type) {
                    this.type = type;
                }
            }

            public static class LinkBeanX {
                /**
                 * rel : alternate
                 * href : http://news.cnblogs.com/n/650034/
                 */

                private String rel;
                private String href;

                public String getRel() {
                    return rel;
                }

                public void setRel(String rel) {
                    this.rel = rel;
                }

                public String getHref() {
                    return href;
                }

                public void setHref(String href) {
                    this.href = href;
                }
            }

            public static class TitleBeanX {
                /**
                 * Content : 全球IPv4地址正式耗尽！
                 * type : text
                 */

                private String Content;
                private String type;

                public String getContent() {
                    return Content;
                }

                public void setContent(String Content) {
                    this.Content = Content;
                }

                public String getType() {
                    return type;
                }

                public void setType(String type) {
                    this.type = type;
                }
            }
        }
    }
}
