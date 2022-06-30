# Zühlke Camp 2022

- [What's this about?](#intro)
- [What are we looking at?](#objectives)
- [What did I learn?](#stuff-i-learned)
- [Conclusions](#conclusions)

## What's this about? <a name="intro"></a>

Zühlke Camp is a yearly 4-day workshop/hackathon/nerd-fest where you spend time with your team
in a nice place, learning new stuff you're interested in :)

The Alice team's camp in 2022 took place in mid-June, in [La Tour-de-Peilz](https://en.wikipedia.org/wiki/La_Tour-de-Peilz).

This page gives a brief overview of topics and technologies I looked at during the Camp, and
some info about what I learned (mainly to serve as a quick tutorial for myself, when I need to
come back and look up something).

## What are we looking at? <a name="objectives"></a>

### Goals

The overarching theme for this Camp for me was probably "DevOps". I wanted to build up 
infrastructure to get from code to an application running on Kubernetes, in an automated way,
using tools I had no (or limited) prior experience with.

### Technologies/Tools/Platforms/...

The technologies/tools/platforms/... I wanted to learn were (in no particular order):

- [Azure](https://azure.microsoft.com/en-us/)

    After having played around with [AWS](https://aws.amazon.com) a bit, I was curious what
    Azure has to offer, and play around with that a bit.

- [Terraform](https://www.terraform.io)

    Terraform served me well while playing around with AWS, so I wanted to dust off my
    knowledge and use it again.

- [Helm](https://helm.sh)

    Using [Kubernetes](https://kubernetes.io) was pretty much a given, so using
    Helm (which I had also used before) was a rather obvious choice.

- [GitHub actions](https://github.com/features/actions)

    Instead of using Azure's own CI/CD tooling, I wanted to take a look at GitHub actions instead,
    which I hadn't used before.

- [GitHub pages](https://pages.github.com)

    I try to document stuff using markdown files anyway, so I decided to try out
    GitHub pages to quickly create a website.

- [Git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

    After reading an article about Git submodules somewhere shortly before camp, I decided
    to try it out.

## What did I learn? <a name="stuff-i-learned"></a>

The results (code, infrastructure definitions, ...) of the four days, together with some how-tos
and readmes for the technical details, are available in two GitHub repositories:

- [application repo](https://github.com/nils-s/z-camp-2022-application)

    Contains a minimal Spring Boot application that provides a single web endpoint (so
    that there is something that can actually be built, deployed, and run), the GitHub actions
    definitions, but also the Helm chart for the application (which is arguably infrastructure and
    should probably live in the other repo).

- [infrastructure repo](https://github.com/nils-s/z-camp-2022-infrastructure)

    Contains the Terraform resource definitions. This could just as well be included in the other
    (main) repo, however, it is a nice self-contained bundle of stuff, so to play around with
    Git submodules, I decided to put it into its own repo.

### Azure

Overall pretty similar to AWS, with the notable exception of Azure AD. Which was probably the
biggest stumbling block for me during the whole camp. Compared to AWS IAM (which feels relatively
straightforward), Azure AD definitely sucked.

Service users (e.g. for Terraform) need an Application, which in turn needs a Service Principal.
Roles are then assigned to the Service Principal (limited to a Scope).

Maybe this whole thing feels more natural to system admin folks with AD experience, but from a
developer perspective (with no prior AD experience), AWS feels more logical.

### Terraform

Still a nice tool :) Different providers for "normal" Azure and Azure AD were a bit surprising,
but that is only a minor technical detail, apart from that there were no surprises.

### Helm

I basically just did a `helm create`, made some minimal changes to some of the auto-generated
files, and then `helm install`-ed stuff. So very limited use of helm during the camp, mainly due
to time constraints.

### GitHub actions

Building a Spring Boot Java application, creating a container image using that application, and
uploading the image into an Azure Container Registry worked like a charm. Having only used Jenkins
as a CI tool before, this felt so much more comfortable.

### GitHub pages

This one was pretty much an afterthought, and I didn't have time to do it during the camp. It
seems easy enough, though, so the page you're looking at was added after the camp, to provide at
least some documentation.

### Git submodules

Git's submodule feature was also only used in the most rudimentary way, to add the
infrastructure repo containing the terraform resource definitions as a submodule to the main repo.

No changes were pushed from the main repo into the infrastructure repo through the submodule,
though, so that is still something I need to try out.

## Conclusions <a name="conclusions"></a>

Overall, this was one of the best camps I've been to. Very nice location, great vibe, and
(probably a first) I managed to look at and achieve all of (or at least most of) what I had in mind
for the Camp :)