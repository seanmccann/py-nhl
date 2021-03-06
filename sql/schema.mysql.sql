drop table if exists games;
drop table if exists teams;
drop table if exists events;
drop table if exists events_players;
drop table if exists events_penaltybox;

drop table if exists players;
drop table if exists stats_skaters_summary;
drop table if exists stats_skaters_timeonice;

/* USED BY events.py */

create table teams (
    team_id integer,
    name varchar(35),
    nickname varchar(35),
    primary key(team_id)
) engine = InnoDB;

create table games (
	season integer,
    game_id integer,
    date date,
    home_team_id integer references nhl.teams(team_id),
    away_team_id integer references nhl.teams(team_id),
    home_team_score integer,
    away_team_score integer,
    rl boolean,
    gcl boolean,
    gcll boolean,
    bs varchar(35),
    bsc varchar(35),
    gs integer,
    primary key(game_id)
) engine = InnoDB;

create table events (
    event_id integer,
    formal_event_id varchar(15),
    game_id integer references games(game_id)
    period integer,
    type varchar(15),
    description varchar(255),
    player_id integer,
    team_id integer references teams(team_id),
    xcoord integer,
    ycoord integer,
    home_score integer,
    away_score integer,
    home_sog integer,
    away_sog integer,
    time numeric,
    video_url varchar(255),
    altvideo_url varchar(255)
    goalie_id integer,
    primary key (game_id, event_id)
) engine = InnoDB;

create table events_players (
    game_id integer,
    event_id integer,
    which varchar(15),
    player_id integer
) engine = InnoDB;

create table events_penaltybox (
    game_id integer,
    event_id integer,
    which varchar(15),
    player_id integer
) engine = InnoDB;

/* USED BY stats.py */

create table players (
    player_id integer,
    jersey integer,
    name varchar(100),
    team_id integer,
    pos varchar(3),
    dob date,
    birthcity varchar(100),
    state varchar(10),
    country varchar(10),
    height integer,
    weight integer,
    shoots char,
    primary key(player_id)
);

create table stats_skaters_summary (
    player_id integer,
    season integer,
    gp integer,
    g integer,
    a integer,
    p integer,
    plusminus integer,
    pim integer,
    pp integer,
    sh integer,
    gw integer,
    ot integer,
    s integer,
    s_pct numeric,
    toi_g numeric,
    sft_g numeric,
    fo_pct numeric,
    primary key (player_id, season)
);

create table stats_skaters_timeonice (
    player_id integer,
    season integer,
    gp integer,
    evenstrength numeric,
    evenstrength_g numeric,
    shorthanded numeric,
    shorthanded_g numeric,
    powerplay numeric,
    powerplay_g numeric,
    total numeric,
    total_g numeric,
    shifts integer,
    total_s numeric,
    shifts_g numeric,
    primary key (player_id, season)
);

create table stats_skaters_faceoff (
    player_id integer,
    season integer,
    gp integer,
    evenstrength_fow integer,
    evenstrength_fol integer,
    powerplay_fow integer,
    powerplay_fol integer,
    shorthanded_fow integer,
    shorthanded_fol integer,
    home_fow integer,
    home_fol integer,
    road_fow integer,
    road_fol integer,
    fow integer,
    fol integer,
    total integer,
    primary key (player_id, season)
);