using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace SimplePoll_DataLayer
{
    [MetadataType(typeof(Poll_Metadata))]
    public partial class Poll
    {
        private Question _Question = null;
        

        public Question Question
        {
            get
            {
                if (this._Question == null)
                {
                    this._Question = new Question();
                }

                return this._Question;
            }
            set
            {
                this._Question = value;
            }

        }
    }

    [MetadataType(typeof(Question_Metadata))]
    public partial class Question
    {
        private List<Question_Answer> _Answers = null;
        public Guid SelectedAnswer { get; set; }

        public List<Question_Answer> Answers
        {
            get
            {
                if (this._Answers == null)
                {
                    this._Answers = new List<Question_Answer>();
                }

                return this._Answers;
            }
            set
            {
                this._Answers = value;
            }

        }
    }

    [MetadataType(typeof(Question_Answer_Metadata))]
    public partial class Question_Answer
    {
        public bool IsSelected { get; set; }
    }

    [MetadataType(typeof(Answers_Header_Metadata))]
    public partial class Answers_Header
    {
        private List<Question_Answer_Response> _Responces = null;


        public List<Question_Answer_Response> Responces
        {
            get
            {
                if (this._Responces == null)
                {
                    this._Responces = new List<Question_Answer_Response>();
                }

                return this._Responces;
            }
            set
            { 
                this._Responces = value;
            }

        }
    }
}

