# Data Quality Is Paramount

<figure class="figure"><img src="https://backhand.tech/images/blog/quality.jpg" alt="Data Quality" /></figure>

Data quality underpins everything we do. Well-designed, fast analytics systems using the shiniest of new technologies are worse than useless if the data that moves through them isn’t an accurate representation of reality. A commitment to good design, testing, and monitoring at every level not only ensures that your insights are real and useful, but also allows you to move faster and add value.


## Address Data Quality At Every Level
The “Hierarchy of Data Science” is [everywhere these days](https://www.google.com/search?q=data+science+hierarchy+of+needs). Applying Maslow’s [famous theory](https://en.wikipedia.org/wiki/Maslow's_hierarchy_of_needs), it directs us to attempt more sophisticated data projects -- data science as the data world equivalent of “self-actualization”, naturally -- only after we have first met more basic, fundamental infrastructure and data governance needs. So, if you have business critical KPI dashboards that rely on missing data or if you try to build deep learning models while your analysts can’t get their heads round SQL, there’s a pretty high possibility you’re not going to meet your goals. Get the simple stuff right and build on it.

<figure class="figure"><img src="https://backhand.tech/images/blog/hierarchy_of_data_science.png" alt="The hierarchy of Data Science" /></figure>

**A commitment to quality is the “simple stuff”.** Data quality doesn’t only mean checking that aggregates rollup correctly, data types are correct and all tables have a primary key. Having well-defined processes and implementing test-driven-development, code review and monitoring at all levels of the analytics stack -- whether you are defining business logic, capturing clickstream events, or performing batch loads of data -- lets you focus on activities that drive value and ensure you spend less time fixing problems.


## Learn From Software Engineering

In traditional software engineering, there’s often a tension between code quality and cost. Do you commit enough resources to write code that’s _just good enough_ to get your product working, or do you invest your resources in writing elegant, clear, well designed code that works exactly like the quick product but is easier to extend and maintain?

[Martin Fowler](https://martinfowler.com/articles/is-quality-worth-cost.html) suggests that there is a particular point in the evolution of a software product where it makes sense to commit to quality code because in the long run it will make additional features quicker to implement:


<blockquote class="blockquote">
This is what happens with poor internal quality. Progress is rapid initially, but as time goes on it gets harder to add new features. Even small changes require programmers to understand large areas of code, code that's difficult to understand. When they make changes, unexpected breakages occur, leading to long test times and defects that need to be fixed.

Concentrating on high internal quality is about reducing that drop off in productivity. Indeed some products see an opposite effect, where developers can accelerate as new features can be easily built by making use of prior work.
</blockquote>

There is a similar process at play in data and analytics engineering; it’s hard to be successful in novel, interesting and valuable problems of optimisation, prediction and machine learning while you’re constantly patching holes in your data pipelines.


## Data Accuracy Is Essential

A data team doesn’t have the wiggle-room to ship a lower quality product as an expediency. From the start, data accuracy is as essential as functionality. While a traditional software user might not care that the code running in their app is a disorganized mish-mash as long as their photo uploads successfully,  a data visualization with incorrect data is always going to be wrong, no matter how beautiful it looks or how well it communicates an essential insight. You could write the most optimised SQL imaginable, but your sales manager will still have your head if they couldn’t land a big whale client because the forecast you supplied them wasn’t accurate.

It’s not just a technical problem. **Trust is key for a data team**; trust that the metrics shown actually match the reality they represent and trust that those metrics will continue to be reported day-in, day-out. The alternative is a degradation of data, with business decisions made on anecdotes or hunches. Once an analytics team digs that hole for themselves it’s very hard to get back out. The only way is to be consistent in delivering useful insights, **and** transparently communicate how those insights are formed. Neither of those things can be produced without a focus on quality throughout the system.

<small><a href='https://www.freepik.com/free-photos-vectors/technology'>Technology vector created by stories - www.freepik.com</a></small>
