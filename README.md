SubTrackr - Micro SaaS for Subscription Billing & Analytics

SubTrackr is a Ruby on Rails-powered Micro SaaS application for freelancers and small businesses to manage subscription billing, clients, and revenue analytics with ease.

🚀 Features

User authentication with Devise (email confirmation, password reset)

Subscription plan management

Stripe integration for recurring payments

Client management (CRM Lite)

Invoice generation with PDF export

Dashboard with revenue analytics (MRR, ARR, monthly revenue)

Webhook handling for real-time payment updates

TailwindCSS for sleek UI

Sidekiq for background job processing


🧱 Tech Stack

Backend: Ruby on Rails 7

Frontend: Hotwire + TailwindCSS

Payments: Stripe API

Charts: Chartkick + Groupdate

PDF Generation: WickedPDF

Background Jobs: Sidekiq + Redis

Database: PostgreSQL


📦 Setup Instructions

1. Clone the repo



git clone https://github.com/robertchonge/subtrackr.git
cd subtrackr

2. Install dependencies



bundle install
yarn install --check-files

3. Setup database



rails db:create db:migrate

4. Configure environment variables Create a .env file:



STRIPE_PUBLIC_KEY=your_stripe_public_key
STRIPE_SECRET_KEY=your_stripe_secret_key
STRIPE_WEBHOOK_SECRET=your_webhook_secret

5. Start server



rails server
sidekiq # in another terminal for background jobs



📊 Screenshots(In the .png files)

Dashboard with revenue chart

Subscription list

Invoice PDF preview


📜 License

MIT License

🤝 Contributing

Feel free to fork, open issues, or submit PRs!


---

Made with ❤️ by Robert Chonge

