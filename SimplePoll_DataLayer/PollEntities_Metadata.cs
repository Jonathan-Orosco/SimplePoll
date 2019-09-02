using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace SimplePoll_DataLayer
{
    public partial class Poll_Metadata
    {
        [Key]
        [Display(Name = "Id")]
        public System.Guid PollId { get; set; }
        [Display(Name = "Name")]
        public string PollName { get; set; }
        [Display(Name = "Desciption")]
        public string PollDescription { get; set; }
        [DataType(DataType.Date)]
        [Display(Name = "Created Date")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public System.DateTime CreatedDateUtc { get; set; }
    }

    public partial class Question_Answer_Metadata
    {
     
        [Required]
        [Display(Name = "Answer")]
        [Association("BuildingInfo", "BuildingId", "BuildingId")]
        public System.Guid AnswerId { get; set; }

        [Required]
        [Display(Name = "Question")]
        [Association("Question", "QuestionId", "QuestionId")]
        public System.Guid QuestionId { get; set; }

        [Display(Name = "Answer")]
        public string AnswerText { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Created Date")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public string CreatedDateUtc { get; set; }
    }

    public partial class Question_Metadata
    {
        [Key]
        [Display(Name = "Id")]
        public System.Guid QuestionId { get; set; }

        [Display(Name = "Poll Identity")]
        [Association("Poll", "PollId", "PollId")]
        public System.Guid PollId { get; set; }

        [Display(Name = "Question")]
        public string QuestionText { get; set; }

        [Display(Name = "Question Point Value")]
        public Nullable<decimal> QuestionValue { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Created Date")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public System.DateTime CreatedDateUtc { get; set; }
    }


    public partial class Answers_Header_Metadata
    {
        public System.Guid AnswerHeaderId { get; set; }
        public long UserId { get; set; }
        public string IpAddress { get; set; }
        public byte TimeZoneId { get; set; }
        public bool IsDstTime { get; set; }
        public System.DateTime CreatedDateUtc { get; set; }
    }
}
