const Review = require('../models/ReviewModel');

const review = {
    addReview:async(form,cusID,categoryID)=>{
        const result = await Review.addReview(form,cusID,categoryID);
    }
}

module.exports = review;