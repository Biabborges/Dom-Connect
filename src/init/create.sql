CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE Users (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
    name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    enterprise VARCHAR(100),
    cpf VARCHAR(14),
    photo_path VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    inicial_date DATE,
    final_date DATE,
    status INT,
    target_audience TEXT,
    expected_impact TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Themes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Sub_Themes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    theme_id INT REFERENCES Themes(id) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Project_sub_themes (
    id SERIAL PRIMARY KEY,
    sub_theme_id INT REFERENCES Sub_Themes(id) NOT NULL,
    project_id INT REFERENCES Projects(id) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE User_sub_themes (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES Users(uuid) NOT NULL,
    sub_theme_id INT REFERENCES Sub_Themes(id) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Interaction (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES Users(uuid) NOT NULL,
    project_id INT REFERENCES Projects(id) NOT NULL,
    interaction INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Interests (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES Users(uuid) NOT NULL,
    project_id INT REFERENCES Projects(id) NOT NULL,
    interest_level INT CHECK (interest_level BETWEEN 1 AND 5) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Recommendations (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES Users(uuid) NOT NULL,
    project_id INT REFERENCES Projects(id) NOT NULL,
    result FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
