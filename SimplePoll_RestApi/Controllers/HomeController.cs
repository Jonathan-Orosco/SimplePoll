using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SimplePoll_DataLayer;

namespace SimplePoll_RestApi.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            List<Poll> Model = new List<Poll>();
            using (DataLayer_SimplePoll dl = new DataLayer_SimplePoll())
            {
                Model.AddRange(dl.Poll_Get());
            }
                
            return View("Index", Model);
        }

        public ActionResult Create()
        {
            Poll newPoll = new Poll();
            Question newQuestion = new Question();

            newPoll.Question = newQuestion;

            return View("CreatePoll", newPoll);
        }

        [HttpPost]
        public ActionResult Create(Poll newPoll)
        {
            using (DataLayer_SimplePoll dl = new DataLayer_SimplePoll())
            {
                dl.Poll_Complete_Save(newPoll);
            }
                return RedirectToAction("Index");
        }

        public ActionResult Take(Guid? PollId)
        {
            Poll selectedPoll = new Poll();

            using (DataLayer_SimplePoll dl = new DataLayer_SimplePoll())
            {
                selectedPoll = dl.Poll_Complete_Get(PollId);
            }

            return View(selectedPoll);
        }

        [HttpPost]
        public ActionResult Take(Poll selectedPoll)
        {
            if(selectedPoll != null)
            {
                Answers_Header header = new Answers_Header();
                header.IpAddress = Request.UserHostAddress;
                
                using (DataLayer_SimplePoll dl = new DataLayer_SimplePoll())
                {
                    long? UserId = dl.User_Save(User.Identity.Name);
                    if (UserId.HasValue && UserId.Value != 0)
                    {
                        header.UserId = UserId.Value;
                    }

                    int? UserAgentId = dl.UserAgent_Save(Request.UserAgent.ToString());

                    if(UserAgentId.HasValue && UserAgentId.Value != 0)
                    {
                        header.UserAgentId = UserAgentId.Value;
                    }

                    Question_Answer selectedAnswer = selectedPoll.Question.Answers.FirstOrDefault(ans => Guid.Equals( ans.AnswerId ,selectedPoll.Question.SelectedAnswer));

                    if(selectedAnswer != null)
                    {
                        Question_Answer_Response response = new Question_Answer_Response();
                        response.AnswerId = selectedAnswer.AnswerId;
                        response.QuestionId = selectedAnswer.QuestionId;
                        header.Responces.Add(response);
                    }

                    dl.Poll_Responses_Save(header);
                }
            }
            return RedirectToAction("Index");
        }

    }
}