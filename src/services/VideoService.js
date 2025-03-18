const VideoModel = require('../models/VideoModel');
const Customer = require('./customerService')
const video = {
    getVideoByID: async (videoID,cusID) => {
        const video = await VideoModel.getVideoByID(videoID,cusID);
        const category = video[0].Category;
        const listVideo = await VideoModel.getVideoList(category,videoID,cusID);
        const result = [video, listVideo];
        return result;
    },
    likeVideo: async (videoID, addLike, addDisLike,cusID) => {
        await VideoModel.likeVideo(videoID, addLike, addDisLike,cusID);
    },
    likeComment: async (commentID, addLike, addDisLike,cusID) => {
        await VideoModel.likeComment(commentID, addLike, addDisLike,cusID);
    },
    addReport: async (videoID,selectedValue,file,textReport)=>{
        await VideoModel.addReport(videoID,selectedValue,file,textReport);
    },
    getCommentByVideoID: async(videoID,cusID)=>{
        const comments = await VideoModel.getCommentByVideoID(videoID);
        let result = Promise.all(comments.map(async (comment)=>{
            const [rows1] = await VideoModel.getLikeDis(comment.CommentID,cusID)
            const customer = await Customer.getCustomerById(comment.CustomerID);
            const name = `${customer.FirstName} ${customer.LastName}`
            const tmp ={comment,cusName : name,avatar : customer.Avatar,LikeDis: `${rows1 && rows1.length > 0 ? rows1[0].Types : ""}`};
            return tmp
        }))
        return result
    },
    addComment:async(videoID,content,parentCom,cusID)=>{
        const result = await VideoModel.addComment(videoID,content,parentCom,cusID);
        const tmp = {
            CommentID: result,
            CustomerID: cusID,
            ParentCmt:parentCom,
            TotalDislike:0,
            TotalLike:0,
            Content:content,
            VideoID:videoID
        }
        return tmp
    }
}

module.exports = video;