# DBMSAssignment-4 
3.34. Database in which researchers submit
their research papers for consideration. Reviews by reviewers are recorded
for use in the paper selection process. The database system caters primarily
to reviewers who record answers to evaluation questions for each paper they
review and make recommendations regarding whether to accept or reject
the paper. The data requirements are summarized as follows:
1. Authors of papers are uniquely identified by e-mail id. First and last names
are also recorded.
2. Each paper is assigned a unique identifier by the system and is described
by a title, abstract, and the name of the electronic file containing the paper.
3. A paper may have multiple authors, but one of the authors is designated as
the contact author.
4. Reviewers of papers are uniquely identified by e-mail address. Each reviewer’s first name, last name, phone number, affiliation, and topics of interest are also recorded.
5. Each paper is assigned between two and four reviewers. A reviewer rates
each paper assigned to him or her on a scale of 1 to 10 in four categories:
technical merit, readability, originality, and relevance to the conference.
Finally, each reviewer provides an overall recommendation regarding
each paper.
6. Each review contains two types of written comments: one to be seen by
the review committee only and the other as feedback to the author(s).

Sql queries for the above data is mentioned in the databaseassignment4.sql file
