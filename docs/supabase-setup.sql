-- 飲み会エージェント Supabase テーブル定義
-- Supabase Dashboard > SQL Editor に貼り付けて実行

-- 飲み会PJテーブル
create table projects (
  id text primary key,
  created_at timestamptz default now(),
  status text default 'ヒアリング中',
  details jsonb default '{}'::jsonb
);

-- 参加者テーブル
create table members (
  id text primary key,
  project_id text references projects(id) on delete cascade,
  slot int,
  name text default '',
  status text default '空席',
  invited_at timestamptz,
  expires_at timestamptz,
  cancel_fee int default 0,
  last_updated timestamptz
);

-- チャット履歴テーブル
create table chat_messages (
  id bigint generated always as identity primary key,
  project_id text references projects(id) on delete cascade,
  member_id text, -- null = ホストチャット
  role text not null, -- 'user' or 'assistant'
  content text not null,
  created_at timestamptz default now()
);

-- 通知テーブル
create table notifications (
  id bigint generated always as identity primary key,
  project_id text references projects(id) on delete cascade,
  type text,
  message text,
  read boolean default false,
  created_at timestamptz default now()
);

-- インデックス
create index idx_members_project on members(project_id);
create index idx_chat_project_member on chat_messages(project_id, member_id);
create index idx_notifs_project on notifications(project_id);

-- RLS無効化（ハッカソンデモ用）
alter table projects enable row level security;
alter table members enable row level security;
alter table chat_messages enable row level security;
alter table notifications enable row level security;

create policy "allow all projects" on projects for all using (true) with check (true);
create policy "allow all members" on members for all using (true) with check (true);
create policy "allow all chat" on chat_messages for all using (true) with check (true);
create policy "allow all notifs" on notifications for all using (true) with check (true);
