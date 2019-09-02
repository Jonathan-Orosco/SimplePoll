using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplePoll_DataLayer
{
    public class DataLayer_SimplePoll : IDisposable
    {
        private SimplePollEntities _dbConnection = null;

        private SimplePollEntities DbConnection
        {
            get
            {
                if(this._dbConnection == null)
                {
                    this._dbConnection = new SimplePollEntities();
                }

                return this._dbConnection;
            }
           
        }

        #region Polls

        public Poll Poll_Complete_Get(Guid? pollId)
        {
            Poll poll = this.Poll_Get(pollId).FirstOrDefault();
            poll.Question =  this.Questions_Get(pollId).FirstOrDefault();

            List<Question_Answer> answers = new List<Question_Answer>();
            answers.AddRange(this.Answers_Get(pollId));

            poll.Question.Answers.AddRange(answers.Where(ans => Guid.Equals(ans.QuestionId, poll.Question.QuestionId)));

            return poll;
        }

        public void Poll_Responses_Save(Answers_Header Model)
        {

            Guid? HeaderId = this.DbConnection.Answers_Header_F_Save(Model.AnswerHeaderId
                ,Model.UserId
                ,Model.IpAddress
                ,Model.TimeZoneId
                ,Model.IsDstTime).FirstOrDefault();
            if(HeaderId.HasValue && !Guid.Equals(HeaderId.Value, Guid.Empty))
            {
                foreach (Question_Answer_Response response in Model.Responces)
                {
                    response.AnswerHeaderId = HeaderId.Value;
                    this.DbConnection.Answers_f_Save(response.AnswerHeaderId
                        , response.QuestionId
                        , response.AnswerId);
                }
            }
            
        }


        public int? Poll_Response(Question_Answer_Response response)
        {
            return this.DbConnection.Answers_f_Save(response.AnswerHeaderId
                    , response.QuestionId
                    , response.AnswerId).FirstOrDefault();
        }

        public Guid? Poll_Header_Save(Answers_Header Model)
        {
            return this.DbConnection.Answers_Header_F_Save(Model.AnswerHeaderId
                , Model.UserId
                , Model.IpAddress
                , Model.TimeZoneId
                , Model.IsDstTime).FirstOrDefault();
        }

        public Guid? Poll_Complete_Save(Poll model)
        {
            Guid? PollId = null;

            if (!string.IsNullOrEmpty(model.PollName) && !string.IsNullOrWhiteSpace(model.PollName))
            {
                PollId = this.DbConnection.Info_Save(
                        model.PollId
                        , model.PollName
                        , model.PollDescription
                    ).FirstOrDefault();

                if (PollId.HasValue && !Guid.Equals(PollId.Value, Guid.Empty))
                {
                    model.PollId = PollId.Value;
                    model.Question.PollId = PollId.Value;
                    Guid? QuestionId = this.Question_Save(model.Question);

                    if (QuestionId.HasValue && !Guid.Equals(QuestionId.Value, Guid.Empty))
                    {
                        foreach(Question_Answer answer in model.Question.Answers)
                        {
                            answer.QuestionId = QuestionId.Value;
                            this.Answers_Save(answer);
                        }
                    }
                }
            }
            return PollId;
        }

        public IEnumerable<Poll> Poll_Get()
        {
            return this.Poll_Get(null, null, null);
        }
        public IEnumerable<Poll> Poll_Get(Guid? pollId)
        {
            return this.Poll_Get(null, null, pollId);
        }
        public IEnumerable<Poll> Poll_Get(byte? pageSize, short? pageIndex)
        {
            return this.Poll_Get(pageSize, pageIndex, null);
        }
        public IEnumerable<Poll> Poll_Get(byte? pageSize, short? pageIndex, Guid? pollId)
        {
            return this.DbConnection.Info_Get(pageSize, pageIndex, pollId);
        }

        #region Questions

        public Guid? Question_Save(Question question)
        {
            return this.DbConnection.Questions_d_Save(question.QuestionId
                , question.PollId
                , question.QuestionText
                , question.QuestionValue).FirstOrDefault();
        }

        public IEnumerable<Question> Questions_Get (Guid? pollId)
        {

            return this.Questions_Get(null, null, null, pollId);
        }

        public IEnumerable<Question> Questions_Get(Guid? questionId, Guid? pollId)
        {

            return this.Questions_Get(null, null, questionId, pollId);
        }

        public IEnumerable<Question> Questions_Get(byte? pageSize, short? pageIndex, Guid?  questionId, Guid? pollId)
        {

            return this.DbConnection.Questions_Get(pageSize, pageIndex, questionId,pollId);
        }

        #endregion

        #region Answers

        public IEnumerable< Guid?> Answers_Save(IEnumerable<Question_Answer> answers)
        {
            foreach(Question_Answer answer in answers)
            {
                yield return this.Answers_Save(answer);
            }
        }

        public Guid? Answers_Save(Question_Answer question_Answer)
        {
            return this.DbConnection.Answers_d_Save(question_Answer.AnswerId
                , question_Answer.QuestionId
                , question_Answer.AnswerText).FirstOrDefault();
        }
        public IEnumerable<Question_Answer> Answers_Get(Guid? pollId)
        {

            return this.Answers_Get(null, null, null, pollId);
        }

        public IEnumerable<Question_Answer> Answers_Get(Guid? answerId, Guid? pollId)
        {

            return this.Answers_Get(null, null, answerId, pollId);
        }

        public IEnumerable<Question_Answer> Answers_Get(byte? pageSize, short? pageIndex, Guid? answerId, Guid? pollId)
        {

            return this.DbConnection.Answers_d_Get(pageSize, pageIndex, answerId, pollId);
        }

        #endregion

        #region Util

        public long? User_Save(string UserName)
        {
            return this.DbConnection.Users_d_Save(null, UserName, null).FirstOrDefault();
        }

        public int? UserAgent_Save(string UserAgent)
        {
            return this.DbConnection.UserAgents_Save(UserAgent).FirstOrDefault();
        }

        public User_TimeZone TimeZone_Get(string DisplayName)
        {
            return this.DbConnection.TimeZones_Get(DisplayName).FirstOrDefault();
        }

        #endregion

        #endregion
        #region IDisposable Support
        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    if(this._dbConnection != null)
                    {
                        this._dbConnection.Dispose();
                    }
                    // TODO: dispose managed state (managed objects).
                }

                // TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
                // TODO: set large fields to null.

                disposedValue = true;
            }
        }

        // TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        // ~DataaLayer_SimplePoll() {
        //   // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        //   Dispose(false);
        // }

        // This code added to correctly implement the disposable pattern.
        public void Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            // TODO: uncomment the following line if the finalizer is overridden above.
            // GC.SuppressFinalize(this);
        }
        #endregion

    }
}
