--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2022-07-02 22:00:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 41368)
-- Name: data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data (
    id integer NOT NULL,
    value character varying(5000)
);


ALTER TABLE public.data OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 41374)
-- Name: data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.data ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 202 (class 1259 OID 41376)
-- Name: departures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departures (
    id bigint NOT NULL,
    crs character varying,
    location_name character varying,
    crs_origin character varying,
    crs_destination character varying,
    origin character varying,
    destination character varying,
    date date,
    std time without time zone,
    "time" time without time zone,
    etd character varying
);


ALTER TABLE public.departures OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 41382)
-- Name: departures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.departures ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.departures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 204 (class 1259 OID 41384)
-- Name: metric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metric (
    percentage_ontime integer,
    quantity_train_to_pad integer,
    quantity_train_to_abw integer,
    quantity_train_to_snf integer,
    id bigint NOT NULL,
    date date
);


ALTER TABLE public.metric OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 41387)
-- Name: metric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.metric ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3000 (class 0 OID 41368)
-- Dependencies: 200
-- Data for Name: data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data (id, value) FROM stdin;
1	{"generatedAt":"2022-06-06T02:23:54.7855993+01:00","locationName":"London Liverpool Street","crs":"LST","platformAvailable":"true"}
2	{"generatedAt":"2022-06-06T02:33:08.4767866+01:00","locationName":"London Liverpool Street","crs":"LST","platformAvailable":"true"}
7	{"generatedAt":"2022-06-06T20:19:47.6314437+01:00","locationName":"London Liverpool Street","crs":"LST","nrccMessages":{"message":"\\nTrains are unable to run between London Liverpool Street and Enfield Town / Cheshunt. More details can be found in <a href=\\"http://nationalrail.co.uk/service_disruptions/298004.aspx\\">Latest Travel News.</a>"},"platformAvailable":"true","trainServices":{"service":[{"std":"20:15","etd":"Cancelled","operator":"London Overground","operatorCode":"LO","isCancelled":"true","serviceType":"train","cancelReason":"This train has been cancelled because of failure of the electricity supply","serviceID":"7o9AOAj0Wp8sLfQxGCVbFg==","origin":{"location":{"locationName":"London Liverpool Street","crs":"LST"}},"destination":{"location":{"locationName":"Cheshunt","crs":"CHN","via":"via Seven Sisters"}}},{"std":"20:18","etd":"On time","platform":"13","operator":"Greater Anglia","operatorCode":"LE","serviceType":"train","serviceID":"E+D8TTeH+1HpF6Tx6embzw==","origin":{"location":{"locationName":"London Liverpool Street","crs":"LST"}},"destination":{"location":{"locationName":"Clacton-on-Sea","crs":"CLT"}},"formation":{"coaches":{"coach":[{"coachClass":"Standard","toilet":"Accessible"},{"coachClass":"Standard"},{"coachClass":"Standard","toilet":"Standard"},{"coachClass":"Standard"},{"coachClass":"Standard","toilet":"Accessible"},{"coachClass":"Standard"},{"coachClass":"Standard","toilet":"Standard"},{"coachClass":"Standard"}]}}},{"std":"20:18","etd":"On time","operator":"TFL Rail","operatorCode":"XR","serviceType":"train","serviceID":"RNvCppHCiIQf0dazbpBQRg==","rsid":"XR035900","origin":{"location":{"locationName":"Abbey Wood","crs":"ABW"}},"destination":{"location":{"locationName":"London Paddington","crs":"PAD"}}},{"std":"20:19","etd":"On time","operator":"TFL Rail","operatorCode":"XR","serviceType":"train","serviceID":"UU2RReTMQeenowygdIb6lw==","rsid":"XR016100","origin":{"location":{"locationName":"London Paddington","crs":"PAD"}},"destination":{"location":{"locationName":"Abbey Wood","crs":"ABW"}}},{"std":"20:19","etd":"On time","platform":"17","operator":"TFL Rail","operatorCode":"XR","serviceType":"train","serviceID":"OhIh7DHUErhcgZ2wmcfcKw==","origin":{"location":{"locationName":"London Liverpool Street","crs":"LST"}},"destination":{"location":{"locationName":"Shenfield","crs":"SNF"}}}]}}
\.


--
-- TOC entry 3002 (class 0 OID 41376)
-- Dependencies: 202
-- Data for Name: departures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departures (id, crs, location_name, crs_origin, crs_destination, origin, destination, date, std, "time", etd) FROM stdin;
124	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-13	12:08:00	12:08:16	On time
125	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-13	12:09:00	12:08:16	On time
126	LST	London Liverpool Street	LST	HFE	London Liverpool Street	Hertford East	2022-06-13	12:12:00	12:08:16	On time
127	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-13	12:12:00	12:08:16	On time
128	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-13	12:13:00	12:13:16	On time
129	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-13	12:14:00	12:13:16	On time
130	LST	London Liverpool Street	LST	CHN	London Liverpool Street	Cheshunt	2022-06-13	12:15:00	12:13:16	On time
131	LST	London Liverpool Street	LST	SOV	London Liverpool Street	Southend Victoria	2022-06-13	12:15:00	12:13:16	On time
132	LST	London Liverpool Street	LST	CHI	London Liverpool Street	Chingford	2022-06-13	12:18:00	12:18:16	On time
133	LST	London Liverpool Street	LST	CLT	London Liverpool Street	Clacton-on-Sea	2022-06-13	12:18:00	12:18:16	On time
134	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-13	12:18:00	12:18:16	On time
135	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-13	12:19:00	12:18:16	On time
136	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-13	12:19:00	12:18:16	On time
137	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-13	12:23:00	12:23:16	On time
138	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-13	12:24:00	12:23:16	On time
139	LST	London Liverpool Street	LST	SSD	London Liverpool Street	Stansted Airport	2022-06-13	12:25:00	12:23:16	On time
140	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-13	12:27:00	12:23:16	On time
144	LST	London Liverpool Street	LST	CMB	London Liverpool Street	Cambridge North	2022-06-13	12:28:00	12:25:41	On time
145	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-13	12:28:00	12:25:41	On time
146	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-13	12:29:00	12:25:41	On time
147	LST	London Liverpool Street	LST	ENF	London Liverpool Street	Enfield Town	2022-06-13	12:30:00	12:25:41	On time
148	LST	London Liverpool Street	LST	NRW	London Liverpool Street	Norwich	2022-06-13	12:30:00	12:25:41	On time
149	LST	London Liverpool Street	LST	CHI	London Liverpool Street	Chingford	2022-06-13	12:33:00	12:25:41	On time
150	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-13	12:33:00	12:25:41	On time
151	LST	London Liverpool Street	LST	SOV	London Liverpool Street	Southend Victoria	2022-06-13	12:33:00	12:25:41	On time
152	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-13	12:34:00	12:25:41	On time
153	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-13	12:34:00	12:25:41	On time
154	LST	London Liverpool Street	LST	CET	London Liverpool Street	Colchester Town	2022-06-13	12:36:00	12:25:41	On time
155	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-13	12:38:00	12:25:41	On time
156	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-13	12:39:00	12:25:41	On time
157	LST	London Liverpool Street	LST	HFE	London Liverpool Street	Hertford East	2022-06-13	12:42:00	12:25:41	On time
158	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-13	12:42:00	12:25:41	On time
159	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-13	12:43:00	12:25:41	On time
160	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-13	12:44:00	12:25:41	On time
161	LST	London Liverpool Street	LST	CHN	London Liverpool Street	Cheshunt	2022-06-13	12:45:00	12:25:41	On time
162	LST	London Liverpool Street	LST	BTR	London Liverpool Street	Braintree	2022-06-13	12:47:00	12:25:41	On time
163	LST	London Liverpool Street	LST	CHI	London Liverpool Street	Chingford	2022-06-13	12:48:00	12:25:41	On time
164	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-13	12:48:00	12:25:41	On time
165	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-13	12:49:00	12:25:41	On time
166	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-13	12:49:00	12:25:41	On time
167	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-13	12:53:00	12:25:41	On time
168	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-13	12:54:00	12:25:41	On time
169	LST	London Liverpool Street	LST	SOV	London Liverpool Street	Southend Victoria	2022-06-13	12:55:00	12:25:41	On time
170	LST	London Liverpool Street	LST	SSD	London Liverpool Street	Stansted Airport	2022-06-13	12:55:00	12:25:41	On time
201	LST	London Liverpool Street	LST	CET	London Liverpool Street	Colchester Town	2022-06-15	17:32:00	17:32:55	On time
202	LST	London Liverpool Street	LST	CHI	London Liverpool Street	Chingford	2022-06-15	17:33:00	17:32:55	On time
203	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	17:33:00	17:32:55	On time
204	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	17:34:00	17:32:55	On time
205	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	17:35:00	17:32:55	On time
206	LST	London Liverpool Street	LST	CMB	London Liverpool Street	Cambridge North	2022-06-15	17:37:00	17:37:55	On time
207	LST	London Liverpool Street	LST	SOV	London Liverpool Street	Southend Victoria	2022-06-15	17:37:00	17:37:55	On time
208	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	17:38:00	17:37:55	On time
209	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	17:39:00	17:37:55	On time
210	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	17:40:00	17:37:55	On time
211	LST	London Liverpool Street	LST	HFE	London Liverpool Street	Hertford East	2022-06-15	17:41:00	17:37:55	On time
212	LST	London Liverpool Street	LST	CHN	London Liverpool Street	Cheshunt	2022-06-15	17:52:00	17:52:01	On time
213	LST	London Liverpool Street	LST	WTM	London Liverpool Street	Witham	2022-06-15	17:52:00	17:52:01	On time
214	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	17:53:00	17:52:01	On time
215	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	17:54:00	17:52:01	On time
216	LST	London Liverpool Street	LST	SOV	London Liverpool Street	Southend Victoria	2022-06-15	17:54:00	17:52:01	On time
217	LST	London Liverpool Street	LST	SSD	London Liverpool Street	Stansted Airport	2022-06-15	17:54:00	17:52:01	On time
218	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	17:55:00	17:52:01	On time
219	LST	London Liverpool Street	LST	BXB	London Liverpool Street	Broxbourne	2022-06-15	17:56:00	17:52:01	On time
220	LST	London Liverpool Street	LST	BXB	London Liverpool Street	Broxbourne	2022-06-15	17:56:00	17:57:01	On time
221	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	17:58:00	17:57:01	On time
222	LST	London Liverpool Street	LST	SMN	London Liverpool Street	Southminster	2022-06-15	17:58:00	17:57:01	On time
223	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	17:59:00	17:57:01	On time
224	LST	London Liverpool Street	LST	ENF	London Liverpool Street	Enfield Town	2022-06-15	18:00:00	17:57:01	On time
225	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	18:00:00	17:57:01	On time
226	LST	London Liverpool Street	LST	IPS	London Liverpool Street	Ipswich	2022-06-15	18:02:00	18:02:01	On time
227	LST	London Liverpool Street	LST	CHI	London Liverpool Street	Chingford	2022-06-15	18:03:00	18:02:01	On time
228	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:03:00	18:02:01	On time
229	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	18:04:00	18:02:01	On time
230	LST	London Liverpool Street	LST	BTR	London Liverpool Street	Braintree	2022-06-15	18:05:00	18:02:01	On time
231	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	18:05:00	18:02:01	On time
232	LST	London Liverpool Street	LST	SSD	London Liverpool Street	Stansted Airport	2022-06-15	18:09:00	18:11:48	Cancelled
233	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	18:10:00	18:11:48	On time
234	LST	London Liverpool Street	LST	HFE	London Liverpool Street	Hertford East	2022-06-15	18:11:00	18:11:48	On time
235	LST	London Liverpool Street	LST	CLT	London Liverpool Street	Clacton-on-Sea	2022-06-15	18:12:00	18:11:48	On time
236	LST	London Liverpool Street	LST	CBG	London Liverpool Street	Cambridge	2022-06-15	18:13:00	18:11:48	On time
237	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:13:00	18:11:48	On time
238	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	18:14:00	18:11:48	On time
239	LST	London Liverpool Street	LST	ENF	London Liverpool Street	Enfield Town	2022-06-15	18:15:00	18:11:48	On time
240	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	18:15:00	18:11:48	On time
241	LST	London Liverpool Street	LST	CBG	London Liverpool Street	Cambridge	2022-06-15	18:13:00	18:14:21	On time
242	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:13:00	18:14:21	On time
243	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	18:14:00	18:14:21	On time
244	LST	London Liverpool Street	LST	ENF	London Liverpool Street	Enfield Town	2022-06-15	18:15:00	18:14:21	On time
245	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	18:15:00	18:14:21	On time
246	LST	London Liverpool Street	LST	CHI	London Liverpool Street	Chingford	2022-06-15	18:18:00	18:14:21	Cancelled
247	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:18:00	18:14:21	On time
248	LST	London Liverpool Street	LST	CHI	London Liverpool Street	Chingford	2022-06-15	18:18:00	18:19:21	Cancelled
249	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:18:00	18:19:21	On time
250	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	18:19:00	18:19:21	On time
251	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	18:20:00	18:19:21	On time
252	LST	London Liverpool Street	LST	CHN	London Liverpool Street	Cheshunt	2022-06-15	18:22:00	18:19:21	On time
253	LST	London Liverpool Street	LST	SOV	London Liverpool Street	Southend Victoria	2022-06-15	18:22:00	18:19:21	On time
254	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:23:00	18:19:21	On time
255	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	18:36:00	18:36:50	On time
256	LST	London Liverpool Street	LST	CMB	London Liverpool Street	Cambridge North	2022-06-15	18:37:00	18:36:50	On time
257	LST	London Liverpool Street	LST	SOV	London Liverpool Street	Southend Victoria	2022-06-15	18:37:00	18:36:50	On time
258	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:38:00	18:36:50	On time
259	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	18:39:00	18:36:50	On time
260	LST	London Liverpool Street	LST	SSD	London Liverpool Street	Stansted Airport	2022-06-15	18:39:00	18:36:50	On time
261	LST	London Liverpool Street	LST	HFE	London Liverpool Street	Hertford East	2022-06-15	18:41:00	18:41:50	On time
262	LST	London Liverpool Street	LST	CLT	London Liverpool Street	Clacton-on-Sea	2022-06-15	18:42:00	18:41:50	On time
263	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	18:42:00	18:41:50	On time
264	LST	London Liverpool Street	LST	CBG	London Liverpool Street	Cambridge	2022-06-15	18:43:00	18:41:50	On time
265	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:43:00	18:41:50	On time
266	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	18:44:00	18:41:50	On time
267	LST	London Liverpool Street	LST	CHN	London Liverpool Street	Cheshunt	2022-06-15	18:45:00	18:41:50	On time
268	LST	London Liverpool Street	LST	HPQ	London Liverpool Street	Harwich International	2022-06-15	18:45:00	18:41:50	On time
269	LST	London Liverpool Street	LST	CHN	London Liverpool Street	Cheshunt	2022-06-15	18:45:00	18:46:50	On time
270	LST	London Liverpool Street	LST	HPQ	London Liverpool Street	Harwich International	2022-06-15	18:45:00	18:46:50	On time
271	LST	London Liverpool Street	LST	CHI	London Liverpool Street	Chingford	2022-06-15	18:48:00	18:46:50	On time
272	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:48:00	18:46:50	On time
273	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	18:48:00	18:46:50	On time
274	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	18:49:00	18:46:50	On time
275	LST	London Liverpool Street	LST	SOV	London Liverpool Street	Southend Victoria	2022-06-15	18:52:00	18:51:50	On time
276	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:53:00	18:51:50	On time
277	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	18:54:00	18:51:50	On time
278	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	18:54:00	18:51:50	On time
279	LST	London Liverpool Street	LST	HFE	London Liverpool Street	Hertford East	2022-06-15	18:56:00	18:56:50	On time
280	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	18:58:00	18:56:50	On time
281	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	18:59:00	18:56:50	On time
282	LST	London Liverpool Street	LST	ENF	London Liverpool Street	Enfield Town	2022-06-15	19:00:00	18:56:50	On time
283	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	19:00:00	18:56:50	On time
284	LST	London Liverpool Street	LST	ENF	London Liverpool Street	Enfield Town	2022-06-15	19:00:00	19:01:50	On time
285	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	19:00:00	19:01:50	On time
286	LST	London Liverpool Street	LST	NRW	London Liverpool Street	Norwich	2022-06-15	19:02:00	19:01:50	On time
287	LST	London Liverpool Street	LST	CHI	London Liverpool Street	Chingford	2022-06-15	19:03:00	19:01:50	On time
288	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	19:03:00	19:01:50	On time
289	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:04:00	19:01:50	On time
290	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	19:06:00	19:06:50	On time
291	LST	London Liverpool Street	LST	KLN	London Liverpool Street	Kings Lynn	2022-06-15	19:07:00	19:06:50	On time
292	LST	London Liverpool Street	LST	IPS	London Liverpool Street	Ipswich	2022-06-15	19:08:00	19:06:50	On time
293	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	19:08:00	19:06:50	On time
294	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:09:00	19:06:50	On time
295	LST	London Liverpool Street	LST	SSD	London Liverpool Street	Stansted Airport	2022-06-15	19:09:00	19:06:50	On time
296	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:19:00	19:20:45	On time
297	LST	London Liverpool Street	LST	ENF	London Liverpool Street	Enfield Town	2022-06-15	19:22:00	19:20:45	On time
298	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	19:23:00	19:20:45	On time
299	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:24:00	19:20:45	On time
300	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:24:00	19:25:45	On time
301	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	19:27:00	19:25:45	On time
302	LST	London Liverpool Street	LST	CMB	London Liverpool Street	Cambridge North	2022-06-15	19:28:00	19:25:45	On time
303	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	19:28:00	19:25:45	On time
304	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:29:00	19:25:45	On time
305	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:29:00	19:30:45	On time
306	LST	London Liverpool Street	LST	ENF	London Liverpool Street	Enfield Town	2022-06-15	19:30:00	19:30:45	On time
307	LST	London Liverpool Street	LST	NRW	London Liverpool Street	Norwich	2022-06-15	19:30:00	19:30:45	On time
308	LST	London Liverpool Street	LST	CHI	London Liverpool Street	Chingford	2022-06-15	19:33:00	19:30:45	On time
309	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	19:33:00	19:30:45	On time
310	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:34:00	19:30:45	On time
311	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	19:34:00	19:30:45	On time
312	LST	London Liverpool Street	LST	SOV	London Liverpool Street	Southend Victoria	2022-06-15	19:34:00	19:30:45	On time
313	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:34:00	19:35:45	On time
314	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	19:34:00	19:35:45	On time
315	LST	London Liverpool Street	LST	CET	London Liverpool Street	Colchester Town	2022-06-15	19:37:00	19:35:45	On time
316	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	19:38:00	19:35:45	On time
317	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:39:00	19:35:45	On time
318	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:39:00	19:40:45	On time
319	LST	London Liverpool Street	LST	SSD	London Liverpool Street	Stansted Airport	2022-06-15	19:40:00	19:40:45	Cancelled
320	LST	London Liverpool Street	LST	HFE	London Liverpool Street	Hertford East	2022-06-15	19:42:00	19:40:45	On time
321	LST	London Liverpool Street	LST	SNF	London Liverpool Street	Shenfield	2022-06-15	19:42:00	19:40:45	On time
322	LST	London Liverpool Street	ABW	PAD	Abbey Wood	London Paddington	2022-06-15	19:43:00	19:40:45	On time
323	LST	London Liverpool Street	PAD	ABW	London Paddington	Abbey Wood	2022-06-15	19:44:00	19:40:45	On time
\.


--
-- TOC entry 3004 (class 0 OID 41384)
-- Dependencies: 204
-- Data for Name: metric; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metric (percentage_ontime, quantity_train_to_pad, quantity_train_to_abw, quantity_train_to_snf, id, date) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 201
-- Name: data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_id_seq', 7, true);


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 203
-- Name: departures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departures_id_seq', 323, true);


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 205
-- Name: metric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metric_id_seq', 1, false);


--
-- TOC entry 2865 (class 2606 OID 41390)
-- Name: data data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT data_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 41392)
-- Name: departures departures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departures
    ADD CONSTRAINT departures_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 41394)
-- Name: metric metric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metric
    ADD CONSTRAINT metric_pkey PRIMARY KEY (id);


-- Completed on 2022-07-02 22:00:16

--
-- PostgreSQL database dump complete
--

