# System Design Documentation

This directory contains system design documentation for various systems, each organized in its own folder with detailed information about the system's architecture, components, and considerations.

## Easy to remember numbers for back-of-the-envelope calculations in system design interviews

### Powers of two table

```
Power    Approx Value (Bytes)       Bytes
-----------------------------------------
10                 1 thousand        1 KB
16                65 thousand       64 KB
20                  1 million        1 MB
30                  1 billion        1 GB
32                  4 billion        4 GB
40                 1 trillion        1 TB
50              1 quadrillion        1 PB
```

### Bytes to store different data types in SQL

```
Data type              Bytes
-----------------------------
ASCII character             1
UNICODE character           2

Bytes calculation for string of length x
-----------------------------------------
(x*(bytes to store the char)*(8 bits)) / 8 bits


https://dev.mysql.com/doc/refman/8.0/en/storage-requirements.html
```

### Latency numbers every programmer should know in seconds

In a system design discussion, we normally discuss numbers in seconds or using relative comparisons.
I doubt we are expected to know the exact numbers so, I created a cheat sheet that would be easy to remember and includes references to newer technology.
```

Latency Comparison Numbers
--------------------------
L1 cache can be accessed 14x faster than L2 cache.
Main memory access is 20x slower than L2, 200x slower than L1.

Zippy Compression at 250 MB/sec.
Send data over 1 Gbps network at 100 MB/sec.
Read sequentially from 1 Gbps Ethernet at 100 MB/sec.
Read randomly/sequentially from SSD at ~ 1 GB/sec.
Read sequentially from main memory at 4 GB/sec.
Read sequentially from disk at 30 MB/sec.
Disk seeks at 100 seeks/sec.
Round-trips within a data center at 2,000 trips/sec.
World-wide round trips at 6-7 trips/sec.

1MB sequential read from memory --> 250 micro seconds
1MB sequential read from ssd    --> 4x of memory
1MB sequential read from disk   --> 80x of memory
```

### Handy numbers for requests calculations.
```
Numbers for requests calculations
---------------------------------
2.5 million seconds per month

1 million reqs/month   -->  .4 reqs/sec
2.6 million reqs/month -->   1 reqs/sec
5 million reqs/month   -->   2 reqs/sec
10 million reqs/month  -->   4 reqs/sec
100 million reqs/month -->  40 reqs/sec
1 billion reqs/month   --> 400 reqs/sec
```

## Systems

### [Amazon Prime](amazon-prime/amazon-prime.md)
A streaming service platform that provides video content, music, and other digital services to subscribers.

### [Autocomplete Search](autocomplete-search/autocomplete-search.md)
A search system that provides real-time suggestions to users as they type, enhancing the search experience.

### [Chat System](chat-system/chat-system.md)
A real-time messaging platform that enables users to communicate through text, voice, and video.

### [DocuSign](docusign/docusign.md)
An electronic signature platform that enables users to sign, send, and manage documents digitally.

### [Dropbox](dropbox/dropbox.md)
A file hosting service that offers cloud storage, file synchronization, and personal cloud.

### [Email Archive](email-archive/email-archive.md)
A system designed to store, index, and retrieve emails for long-term storage and compliance purposes.

### [Google Drive](google-drive/google-drive.md)
A file storage and synchronization service that allows users to store files in the cloud and access them from anywhere.

### [Google Docs](google-docs/google-docs.md)
A web-based word processor that allows users to create and edit documents collaboratively in real-time.

### [Instagram](instagram/instagram.md)
A social media platform for sharing photos and videos, with features like stories, reels, and direct messaging.

### [News Feed](news-feed/news-feed.md)
A system designed to deliver personalized content to users in real-time, aggregating updates from various sources.

### [Notification System](notification-system/notification-system.md)
A system designed to deliver real-time updates and alerts to users across multiple platforms.

### [Parking Garage](parking-garage/parking-garage.md)
A system designed to manage parking spaces, handle payments, and provide real-time updates on parking availability.

### [PasteBin](pastebin/pastebin.md)
A web service that allows users to store and share text snippets, code, and other content through unique URLs.

### [Rate Limiter](rate-limiter/rate-limiter.md)
A system designed to control the rate of requests a user can make to a service, preventing abuse and ensuring fair usage.

### [Shopify](shopify/shopify.md)
An e-commerce platform that enables businesses to create online stores, manage products, and process orders.

### [Tag Service](tag-service/tag-service.md)
A system designed to manage and organize content through tags, enabling efficient content categorization and search.

### [Template](template/template.md)
A standardized structure for documenting system designs, ensuring consistency and completeness across different system design documents.

### [TicketMaster](ticketmaster/ticketmaster.md)
A ticket sales and distribution platform that enables users to purchase tickets for events.

### [TikTok](tiktok/tiktok.md)
A social media platform that allows users to create, share, and discover short-form videos.

### [Uber](uber/uber.md)
A ride-sharing platform that connects riders with drivers, enabling users to request rides and process payments.

### [URL Shortener](url-shortener/url-shortener.md)
A service that creates short, unique URLs for long web addresses, making them easier to share and manage.

### [Web Crawler](webcrawler/webcrawler.md)
A system designed to systematically browse the web, index web pages, and extract data for various purposes.

### [YouTube](youtube/youtube.md)
A video-sharing platform that allows users to upload, view, and interact with videos.

## Structure

Each system design folder contains:
- A `.md` file with detailed information about the system's design
- A `.drawio` file containing the system's architecture diagram

## Usage

To view a system's design documentation, navigate to its respective folder and open the `.md` file. The `.drawio` files can be opened with [draw.io](https://draw.io) or any compatible diagram editor. 