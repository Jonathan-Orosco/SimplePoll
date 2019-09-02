﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SimplePoll_DataLayer
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class SimplePollEntities : DbContext
    {
        public SimplePollEntities()
            : base("name=SimplePollEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
    
        public virtual ObjectResult<Question_Answer> Answers_d_Get(Nullable<byte> pageSize, Nullable<short> pageIndex, Nullable<System.Guid> answerId, Nullable<System.Guid> pollId)
        {
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("PageSize", pageSize) :
                new ObjectParameter("PageSize", typeof(byte));
    
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("PageIndex", pageIndex) :
                new ObjectParameter("PageIndex", typeof(short));
    
            var answerIdParameter = answerId.HasValue ?
                new ObjectParameter("AnswerId", answerId) :
                new ObjectParameter("AnswerId", typeof(System.Guid));
    
            var pollIdParameter = pollId.HasValue ?
                new ObjectParameter("PollId", pollId) :
                new ObjectParameter("PollId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Question_Answer>("Answers_d_Get", pageSizeParameter, pageIndexParameter, answerIdParameter, pollIdParameter);
        }
    
        public virtual ObjectResult<Question_Answer_Response> Answers_f_Get(Nullable<byte> pageSize, Nullable<short> pageIndex, Nullable<System.Guid> answerHeaderId)
        {
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("PageSize", pageSize) :
                new ObjectParameter("PageSize", typeof(byte));
    
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("PageIndex", pageIndex) :
                new ObjectParameter("PageIndex", typeof(short));
    
            var answerHeaderIdParameter = answerHeaderId.HasValue ?
                new ObjectParameter("AnswerHeaderId", answerHeaderId) :
                new ObjectParameter("AnswerHeaderId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Question_Answer_Response>("Answers_f_Get", pageSizeParameter, pageIndexParameter, answerHeaderIdParameter);
        }
    
        public virtual ObjectResult<Answers_Header> Answers_Header_F_Get(Nullable<byte> pageSize, Nullable<short> pageIndex, Nullable<System.Guid> answerHeaderId)
        {
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("PageSize", pageSize) :
                new ObjectParameter("PageSize", typeof(byte));
    
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("PageIndex", pageIndex) :
                new ObjectParameter("PageIndex", typeof(short));
    
            var answerHeaderIdParameter = answerHeaderId.HasValue ?
                new ObjectParameter("AnswerHeaderId", answerHeaderId) :
                new ObjectParameter("AnswerHeaderId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Answers_Header>("Answers_Header_F_Get", pageSizeParameter, pageIndexParameter, answerHeaderIdParameter);
        }
    
        public virtual ObjectResult<Poll> Info_Get(Nullable<byte> pageSize, Nullable<short> pageIndex, Nullable<System.Guid> pollId)
        {
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("PageSize", pageSize) :
                new ObjectParameter("PageSize", typeof(byte));
    
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("PageIndex", pageIndex) :
                new ObjectParameter("PageIndex", typeof(short));
    
            var pollIdParameter = pollId.HasValue ?
                new ObjectParameter("PollId", pollId) :
                new ObjectParameter("PollId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Poll>("Info_Get", pageSizeParameter, pageIndexParameter, pollIdParameter);
        }
    
        public virtual ObjectResult<Question> Questions_Get(Nullable<byte> pageSize, Nullable<short> pageIndex, Nullable<System.Guid> questionId, Nullable<System.Guid> pollId)
        {
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("PageSize", pageSize) :
                new ObjectParameter("PageSize", typeof(byte));
    
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("PageIndex", pageIndex) :
                new ObjectParameter("PageIndex", typeof(short));
    
            var questionIdParameter = questionId.HasValue ?
                new ObjectParameter("QuestionId", questionId) :
                new ObjectParameter("QuestionId", typeof(System.Guid));
    
            var pollIdParameter = pollId.HasValue ?
                new ObjectParameter("PollId", pollId) :
                new ObjectParameter("PollId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Question>("Questions_Get", pageSizeParameter, pageIndexParameter, questionIdParameter, pollIdParameter);
        }
    
        public virtual ObjectResult<Nullable<short>> TimeZones_Save(Nullable<short> timeZoneId, string displayName, Nullable<short> offsetMinutes)
        {
            var timeZoneIdParameter = timeZoneId.HasValue ?
                new ObjectParameter("TimeZoneId", timeZoneId) :
                new ObjectParameter("TimeZoneId", typeof(short));
    
            var displayNameParameter = displayName != null ?
                new ObjectParameter("DisplayName", displayName) :
                new ObjectParameter("DisplayName", typeof(string));
    
            var offsetMinutesParameter = offsetMinutes.HasValue ?
                new ObjectParameter("OffsetMinutes", offsetMinutes) :
                new ObjectParameter("OffsetMinutes", typeof(short));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<short>>("TimeZones_Save", timeZoneIdParameter, displayNameParameter, offsetMinutesParameter);
        }
    
        public virtual ObjectResult<Nullable<long>> Users_d_Save(Nullable<long> userId, string userName, Nullable<bool> isDeleteAction)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(long));
    
            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));
    
            var isDeleteActionParameter = isDeleteAction.HasValue ?
                new ObjectParameter("IsDeleteAction", isDeleteAction) :
                new ObjectParameter("IsDeleteAction", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<long>>("Users_d_Save", userIdParameter, userNameParameter, isDeleteActionParameter);
        }
    
        public virtual ObjectResult<Nullable<System.Guid>> Answers_d_Save(Nullable<System.Guid> answerId, Nullable<System.Guid> questionId, string answerText)
        {
            var answerIdParameter = answerId.HasValue ?
                new ObjectParameter("AnswerId", answerId) :
                new ObjectParameter("AnswerId", typeof(System.Guid));
    
            var questionIdParameter = questionId.HasValue ?
                new ObjectParameter("QuestionId", questionId) :
                new ObjectParameter("QuestionId", typeof(System.Guid));
    
            var answerTextParameter = answerText != null ?
                new ObjectParameter("AnswerText", answerText) :
                new ObjectParameter("AnswerText", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<System.Guid>>("Answers_d_Save", answerIdParameter, questionIdParameter, answerTextParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> Answers_f_Save(Nullable<System.Guid> answerHeaderId, Nullable<System.Guid> questionId, Nullable<System.Guid> answerId)
        {
            var answerHeaderIdParameter = answerHeaderId.HasValue ?
                new ObjectParameter("AnswerHeaderId", answerHeaderId) :
                new ObjectParameter("AnswerHeaderId", typeof(System.Guid));
    
            var questionIdParameter = questionId.HasValue ?
                new ObjectParameter("QuestionId", questionId) :
                new ObjectParameter("QuestionId", typeof(System.Guid));
    
            var answerIdParameter = answerId.HasValue ?
                new ObjectParameter("AnswerId", answerId) :
                new ObjectParameter("AnswerId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("Answers_f_Save", answerHeaderIdParameter, questionIdParameter, answerIdParameter);
        }
    
        public virtual ObjectResult<Nullable<System.Guid>> Answers_Header_F_Save(Nullable<System.Guid> answerHeaderId, Nullable<long> userId, string ipAddress, Nullable<short> timeZoneId, Nullable<bool> isDstTime)
        {
            var answerHeaderIdParameter = answerHeaderId.HasValue ?
                new ObjectParameter("AnswerHeaderId", answerHeaderId) :
                new ObjectParameter("AnswerHeaderId", typeof(System.Guid));
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(long));
    
            var ipAddressParameter = ipAddress != null ?
                new ObjectParameter("IpAddress", ipAddress) :
                new ObjectParameter("IpAddress", typeof(string));
    
            var timeZoneIdParameter = timeZoneId.HasValue ?
                new ObjectParameter("TimeZoneId", timeZoneId) :
                new ObjectParameter("TimeZoneId", typeof(short));
    
            var isDstTimeParameter = isDstTime.HasValue ?
                new ObjectParameter("IsDstTime", isDstTime) :
                new ObjectParameter("IsDstTime", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<System.Guid>>("Answers_Header_F_Save", answerHeaderIdParameter, userIdParameter, ipAddressParameter, timeZoneIdParameter, isDstTimeParameter);
        }
    
        public virtual ObjectResult<Nullable<System.Guid>> Info_Save(Nullable<System.Guid> pollId, string pollName, string pollDescription)
        {
            var pollIdParameter = pollId.HasValue ?
                new ObjectParameter("PollId", pollId) :
                new ObjectParameter("PollId", typeof(System.Guid));
    
            var pollNameParameter = pollName != null ?
                new ObjectParameter("PollName", pollName) :
                new ObjectParameter("PollName", typeof(string));
    
            var pollDescriptionParameter = pollDescription != null ?
                new ObjectParameter("PollDescription", pollDescription) :
                new ObjectParameter("PollDescription", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<System.Guid>>("Info_Save", pollIdParameter, pollNameParameter, pollDescriptionParameter);
        }
    
        public virtual ObjectResult<Nullable<System.Guid>> Questions_d_Save(Nullable<System.Guid> questionId, Nullable<System.Guid> pollId, string questionText, Nullable<decimal> questionValue)
        {
            var questionIdParameter = questionId.HasValue ?
                new ObjectParameter("QuestionId", questionId) :
                new ObjectParameter("QuestionId", typeof(System.Guid));
    
            var pollIdParameter = pollId.HasValue ?
                new ObjectParameter("PollId", pollId) :
                new ObjectParameter("PollId", typeof(System.Guid));
    
            var questionTextParameter = questionText != null ?
                new ObjectParameter("QuestionText", questionText) :
                new ObjectParameter("QuestionText", typeof(string));
    
            var questionValueParameter = questionValue.HasValue ?
                new ObjectParameter("QuestionValue", questionValue) :
                new ObjectParameter("QuestionValue", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<System.Guid>>("Questions_d_Save", questionIdParameter, pollIdParameter, questionTextParameter, questionValueParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> UserAgents_Save(string userAgent)
        {
            var userAgentParameter = userAgent != null ?
                new ObjectParameter("UserAgent", userAgent) :
                new ObjectParameter("UserAgent", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("UserAgents_Save", userAgentParameter);
        }
    
        public virtual ObjectResult<User_TimeZone> TimeZones_Get(string displayName)
        {
            var displayNameParameter = displayName != null ?
                new ObjectParameter("DisplayName", displayName) :
                new ObjectParameter("DisplayName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<User_TimeZone>("TimeZones_Get", displayNameParameter);
        }
    
        public virtual ObjectResult<Users_d_Select_Result> Users_d_Get(Nullable<byte> pageSize, Nullable<short> pageIndex, Nullable<long> userId)
        {
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("PageSize", pageSize) :
                new ObjectParameter("PageSize", typeof(byte));
    
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("PageIndex", pageIndex) :
                new ObjectParameter("PageIndex", typeof(short));
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Users_d_Select_Result>("Users_d_Get", pageSizeParameter, pageIndexParameter, userIdParameter);
        }
    }
}
