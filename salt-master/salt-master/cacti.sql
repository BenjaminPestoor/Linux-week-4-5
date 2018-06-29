-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 28, 2018 at 07:42 AM
-- Server version: 5.7.22-0ubuntu0.17.10.1
-- PHP Version: 7.1.17-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cacti`
--

-- --------------------------------------------------------

--
-- Table structure for table `aggregate_graphs`
--

CREATE TABLE `aggregate_graphs` (
  `id` int(10) UNSIGNED NOT NULL,
  `aggregate_template_id` int(10) UNSIGNED NOT NULL,
  `template_propogation` char(2) NOT NULL DEFAULT '',
  `local_graph_id` int(10) UNSIGNED NOT NULL,
  `title_format` varchar(128) NOT NULL,
  `graph_template_id` int(10) UNSIGNED NOT NULL,
  `gprint_prefix` varchar(64) NOT NULL,
  `graph_type` int(10) UNSIGNED NOT NULL,
  `total` int(10) UNSIGNED NOT NULL,
  `total_type` int(10) UNSIGNED NOT NULL,
  `total_prefix` varchar(64) NOT NULL,
  `order_type` int(10) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggregate Graph Definitions';

-- --------------------------------------------------------

--
-- Table structure for table `aggregate_graphs_graph_item`
--

CREATE TABLE `aggregate_graphs_graph_item` (
  `aggregate_graph_id` int(10) UNSIGNED NOT NULL,
  `graph_templates_item_id` int(10) UNSIGNED NOT NULL,
  `sequence` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `color_template` int(11) UNSIGNED NOT NULL,
  `t_graph_type_id` char(2) DEFAULT '',
  `graph_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `t_cdef_id` char(2) DEFAULT '',
  `cdef_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `item_skip` char(2) NOT NULL,
  `item_total` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggregate Graph Graph Items';

-- --------------------------------------------------------

--
-- Table structure for table `aggregate_graphs_items`
--

CREATE TABLE `aggregate_graphs_items` (
  `aggregate_graph_id` int(10) UNSIGNED NOT NULL,
  `local_graph_id` int(10) UNSIGNED NOT NULL,
  `sequence` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggregate Graph Items';

-- --------------------------------------------------------

--
-- Table structure for table `aggregate_graph_templates`
--

CREATE TABLE `aggregate_graph_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `graph_template_id` int(10) UNSIGNED NOT NULL,
  `gprint_prefix` varchar(64) NOT NULL,
  `graph_type` int(10) UNSIGNED NOT NULL,
  `total` int(10) UNSIGNED NOT NULL,
  `total_type` int(10) UNSIGNED NOT NULL,
  `total_prefix` varchar(64) NOT NULL,
  `order_type` int(10) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Template Definitions for Aggregate Graphs';

-- --------------------------------------------------------

--
-- Table structure for table `aggregate_graph_templates_graph`
--

CREATE TABLE `aggregate_graph_templates_graph` (
  `aggregate_template_id` int(10) UNSIGNED NOT NULL,
  `t_image_format_id` char(2) DEFAULT '',
  `image_format_id` tinyint(1) NOT NULL DEFAULT '0',
  `t_height` char(2) DEFAULT '',
  `height` mediumint(8) NOT NULL DEFAULT '0',
  `t_width` char(2) DEFAULT '',
  `width` mediumint(8) NOT NULL DEFAULT '0',
  `t_upper_limit` char(2) DEFAULT '',
  `upper_limit` varchar(20) NOT NULL DEFAULT '0',
  `t_lower_limit` char(2) DEFAULT '',
  `lower_limit` varchar(20) NOT NULL DEFAULT '0',
  `t_vertical_label` char(2) DEFAULT '',
  `vertical_label` varchar(200) DEFAULT '',
  `t_slope_mode` char(2) DEFAULT '',
  `slope_mode` char(2) DEFAULT 'on',
  `t_auto_scale` char(2) DEFAULT '',
  `auto_scale` char(2) DEFAULT '',
  `t_auto_scale_opts` char(2) DEFAULT '',
  `auto_scale_opts` tinyint(1) NOT NULL DEFAULT '0',
  `t_auto_scale_log` char(2) DEFAULT '',
  `auto_scale_log` char(2) DEFAULT '',
  `t_scale_log_units` char(2) DEFAULT '',
  `scale_log_units` char(2) DEFAULT '',
  `t_auto_scale_rigid` char(2) DEFAULT '',
  `auto_scale_rigid` char(2) DEFAULT '',
  `t_auto_padding` char(2) DEFAULT '',
  `auto_padding` char(2) DEFAULT '',
  `t_base_value` char(2) DEFAULT '',
  `base_value` mediumint(8) NOT NULL DEFAULT '0',
  `t_grouping` char(2) DEFAULT '',
  `grouping` char(2) NOT NULL DEFAULT '',
  `t_unit_value` char(2) DEFAULT '',
  `unit_value` varchar(20) DEFAULT '',
  `t_unit_exponent_value` char(2) DEFAULT '',
  `unit_exponent_value` varchar(5) NOT NULL DEFAULT '',
  `t_alt_y_grid` char(2) DEFAULT '',
  `alt_y_grid` char(2) DEFAULT NULL,
  `t_right_axis` char(2) DEFAULT '',
  `right_axis` varchar(20) DEFAULT NULL,
  `t_right_axis_label` char(2) DEFAULT '',
  `right_axis_label` varchar(200) DEFAULT NULL,
  `t_right_axis_format` char(2) DEFAULT '',
  `right_axis_format` mediumint(8) DEFAULT NULL,
  `t_right_axis_formatter` char(2) DEFAULT '',
  `right_axis_formatter` varchar(10) DEFAULT NULL,
  `t_left_axis_formatter` char(2) DEFAULT '',
  `left_axis_formatter` varchar(10) DEFAULT NULL,
  `t_no_gridfit` char(2) DEFAULT '',
  `no_gridfit` char(2) DEFAULT NULL,
  `t_unit_length` char(2) DEFAULT '',
  `unit_length` varchar(10) DEFAULT NULL,
  `t_tab_width` char(2) DEFAULT '',
  `tab_width` varchar(20) DEFAULT '30',
  `t_dynamic_labels` char(2) DEFAULT '',
  `dynamic_labels` char(2) DEFAULT NULL,
  `t_force_rules_legend` char(2) DEFAULT '',
  `force_rules_legend` char(2) DEFAULT NULL,
  `t_legend_position` char(2) DEFAULT '',
  `legend_position` varchar(10) DEFAULT NULL,
  `t_legend_direction` char(2) DEFAULT '0',
  `legend_direction` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggregate Template Graph Data';

-- --------------------------------------------------------

--
-- Table structure for table `aggregate_graph_templates_item`
--

CREATE TABLE `aggregate_graph_templates_item` (
  `aggregate_template_id` int(10) UNSIGNED NOT NULL,
  `graph_templates_item_id` int(10) UNSIGNED NOT NULL,
  `sequence` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `color_template` int(11) NOT NULL,
  `t_graph_type_id` char(2) DEFAULT '',
  `graph_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `t_cdef_id` char(2) DEFAULT '',
  `cdef_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `item_skip` char(2) NOT NULL,
  `item_total` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggregate Template Graph Items';

-- --------------------------------------------------------

--
-- Table structure for table `automation_devices`
--

CREATE TABLE `automation_devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `network_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(17) NOT NULL DEFAULT '',
  `community` varchar(100) NOT NULL DEFAULT '',
  `snmp_version` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `snmp_port` int(10) UNSIGNED NOT NULL DEFAULT '161',
  `snmp_username` varchar(50) DEFAULT NULL,
  `snmp_password` varchar(50) DEFAULT NULL,
  `snmp_auth_protocol` char(5) DEFAULT '',
  `snmp_priv_passphrase` varchar(200) DEFAULT '',
  `snmp_priv_protocol` char(6) DEFAULT '',
  `snmp_context` varchar(64) DEFAULT '',
  `snmp_engine_id` varchar(64) DEFAULT '',
  `sysName` varchar(100) NOT NULL DEFAULT '',
  `sysLocation` varchar(255) NOT NULL DEFAULT '',
  `sysContact` varchar(255) NOT NULL DEFAULT '',
  `sysDescr` varchar(255) NOT NULL DEFAULT '',
  `sysUptime` int(32) NOT NULL DEFAULT '0',
  `os` varchar(64) NOT NULL DEFAULT '',
  `snmp` tinyint(4) NOT NULL DEFAULT '0',
  `known` tinyint(4) NOT NULL DEFAULT '0',
  `up` tinyint(4) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table of Discovered Devices';

-- --------------------------------------------------------

--
-- Table structure for table `automation_graph_rules`
--

CREATE TABLE `automation_graph_rules` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `snmp_query_id` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `graph_type_id` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `enabled` char(2) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Automation Graph Rules';

--
-- Dumping data for table `automation_graph_rules`
--

INSERT INTO `automation_graph_rules` (`id`, `name`, `snmp_query_id`, `graph_type_id`, `enabled`) VALUES
(1, 'Traffic 64 bit Server', 1, 14, ''),
(2, 'Traffic 64 bit Server Linux', 1, 14, ''),
(3, 'Disk Space', 8, 18, '');

-- --------------------------------------------------------

--
-- Table structure for table `automation_graph_rule_items`
--

CREATE TABLE `automation_graph_rule_items` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `rule_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `operation` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `field` varchar(255) NOT NULL DEFAULT '',
  `operator` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Automation Graph Rule Items';

--
-- Dumping data for table `automation_graph_rule_items`
--

INSERT INTO `automation_graph_rule_items` (`id`, `rule_id`, `sequence`, `operation`, `field`, `operator`, `pattern`) VALUES
(1, 1, 1, 0, 'ifOperStatus', 7, 'Up'),
(2, 1, 2, 1, 'ifIP', 16, ''),
(3, 1, 3, 1, 'ifHwAddr', 16, ''),
(4, 2, 1, 0, 'ifOperStatus', 7, 'Up'),
(5, 2, 2, 1, 'ifIP', 16, ''),
(6, 2, 3, 1, 'ifHwAddr', 16, '');

-- --------------------------------------------------------

--
-- Table structure for table `automation_ips`
--

CREATE TABLE `automation_ips` (
  `ip_address` varchar(20) NOT NULL DEFAULT '',
  `hostname` varchar(100) DEFAULT NULL,
  `network_id` int(10) UNSIGNED DEFAULT NULL,
  `pid` int(10) UNSIGNED DEFAULT NULL,
  `status` int(10) UNSIGNED DEFAULT NULL,
  `thread` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='List of discoverable ip addresses used for scanning';

-- --------------------------------------------------------

--
-- Table structure for table `automation_match_rule_items`
--

CREATE TABLE `automation_match_rule_items` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `rule_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `rule_type` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `operation` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `field` varchar(255) NOT NULL DEFAULT '',
  `operator` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Automation Match Rule Items';

--
-- Dumping data for table `automation_match_rule_items`
--

INSERT INTO `automation_match_rule_items` (`id`, `rule_id`, `rule_type`, `sequence`, `operation`, `field`, `operator`, `pattern`) VALUES
(1, 1, 1, 1, 0, 'h.description', 14, ''),
(2, 1, 1, 2, 1, 'h.snmp_version', 12, '2'),
(3, 1, 3, 1, 0, 'ht.name', 1, 'Linux'),
(4, 2, 1, 1, 0, 'ht.name', 1, 'Linux'),
(5, 2, 1, 2, 1, 'h.snmp_version', 12, '2'),
(6, 2, 3, 1, 0, 'ht.name', 1, 'SNMP'),
(7, 2, 3, 2, 1, 'gt.name', 1, 'Traffic');

-- --------------------------------------------------------

--
-- Table structure for table `automation_networks`
--

CREATE TABLE `automation_networks` (
  `id` int(10) UNSIGNED NOT NULL,
  `poller_id` int(10) UNSIGNED DEFAULT '1',
  `site_id` int(10) UNSIGNED DEFAULT '1',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name for this network',
  `subnet_range` varchar(1024) NOT NULL DEFAULT '' COMMENT 'Defined subnet ranges for discovery',
  `dns_servers` varchar(128) NOT NULL DEFAULT '' COMMENT 'DNS Servers to use for name resolution',
  `enabled` char(2) DEFAULT '',
  `snmp_id` int(10) UNSIGNED DEFAULT NULL,
  `enable_netbios` char(2) DEFAULT '',
  `add_to_cacti` char(2) DEFAULT '',
  `total_ips` int(10) UNSIGNED DEFAULT '0',
  `up_hosts` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `snmp_hosts` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ping_method` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The ping method (ICMP:TCP:UDP)',
  `ping_port` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'For TCP:UDP the port to ping',
  `ping_timeout` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The ping timeout in seconds',
  `ping_retries` int(10) UNSIGNED DEFAULT '0',
  `sched_type` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Schedule type: manual or automatic',
  `threads` int(10) UNSIGNED DEFAULT '1',
  `run_limit` int(10) UNSIGNED DEFAULT '0' COMMENT 'The maximum runtime for the discovery',
  `start_at` varchar(20) DEFAULT NULL,
  `next_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recur_every` int(10) UNSIGNED DEFAULT '1',
  `day_of_week` varchar(45) DEFAULT NULL COMMENT 'The days of week to run in crontab format',
  `month` varchar(45) DEFAULT NULL COMMENT 'The months to run in crontab format',
  `day_of_month` varchar(45) DEFAULT NULL COMMENT 'The days of month to run in crontab format',
  `monthly_week` varchar(45) DEFAULT NULL,
  `monthly_day` varchar(45) DEFAULT NULL,
  `last_runtime` double NOT NULL DEFAULT '0' COMMENT 'The last runtime for discovery',
  `last_started` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the discovery last started',
  `last_status` varchar(128) NOT NULL DEFAULT '' COMMENT 'The last exit message if any',
  `rerun_data_queries` char(2) DEFAULT NULL COMMENT 'Rerun data queries or not for existing hosts'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores scanning subnet definitions';

--
-- Dumping data for table `automation_networks`
--

INSERT INTO `automation_networks` (`id`, `poller_id`, `site_id`, `name`, `subnet_range`, `dns_servers`, `enabled`, `snmp_id`, `enable_netbios`, `add_to_cacti`, `total_ips`, `up_hosts`, `snmp_hosts`, `ping_method`, `ping_port`, `ping_timeout`, `ping_retries`, `sched_type`, `threads`, `run_limit`, `start_at`, `next_start`, `recur_every`, `day_of_week`, `month`, `day_of_month`, `monthly_week`, `monthly_day`, `last_runtime`, `last_started`, `last_status`, `rerun_data_queries`) VALUES
(1, 1, 1, 'Test Network', '192.168.1.0/24', '', '', 1, 'on', '', 254, 14, 8, 2, 22, 400, 1, 2, 10, 1200, '2015-05-17 16:15', '0000-00-00 00:00:00', 2, '4', '1,2,6', '1,2,3,4,6,7,11,12,14,15,17,19,26,32', '', '', 40.178689002991, '2015-05-19 02:23:22', '', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `automation_processes`
--

CREATE TABLE `automation_processes` (
  `pid` int(8) UNSIGNED NOT NULL,
  `poller_id` int(10) UNSIGNED DEFAULT '1',
  `network_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `task` varchar(20) DEFAULT '',
  `status` varchar(20) DEFAULT NULL,
  `command` varchar(20) DEFAULT NULL,
  `up_hosts` int(10) UNSIGNED DEFAULT '0',
  `snmp_hosts` int(10) UNSIGNED DEFAULT '0',
  `heartbeat` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='Table tracking active poller processes';

-- --------------------------------------------------------

--
-- Table structure for table `automation_snmp`
--

CREATE TABLE `automation_snmp` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Group of SNMP Option Sets';

--
-- Dumping data for table `automation_snmp`
--

INSERT INTO `automation_snmp` (`id`, `name`) VALUES
(1, 'Default Option Set');

-- --------------------------------------------------------

--
-- Table structure for table `automation_snmp_items`
--

CREATE TABLE `automation_snmp_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `snmp_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `snmp_version` varchar(100) NOT NULL DEFAULT '',
  `snmp_readstring` varchar(100) NOT NULL,
  `snmp_port` int(10) NOT NULL DEFAULT '161',
  `snmp_timeout` int(10) UNSIGNED NOT NULL DEFAULT '500',
  `snmp_retries` tinyint(11) UNSIGNED NOT NULL DEFAULT '3',
  `max_oids` int(12) UNSIGNED DEFAULT '10',
  `snmp_username` varchar(50) DEFAULT NULL,
  `snmp_password` varchar(50) DEFAULT NULL,
  `snmp_auth_protocol` char(5) DEFAULT '',
  `snmp_priv_passphrase` varchar(200) DEFAULT '',
  `snmp_priv_protocol` char(6) DEFAULT '',
  `snmp_context` varchar(64) DEFAULT '',
  `snmp_engine_id` varchar(64) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Set of SNMP Options';

--
-- Dumping data for table `automation_snmp_items`
--

INSERT INTO `automation_snmp_items` (`id`, `snmp_id`, `sequence`, `snmp_version`, `snmp_readstring`, `snmp_port`, `snmp_timeout`, `snmp_retries`, `max_oids`, `snmp_username`, `snmp_password`, `snmp_auth_protocol`, `snmp_priv_passphrase`, `snmp_priv_protocol`, `snmp_context`, `snmp_engine_id`) VALUES
(1, 1, 1, '2', 'public', 161, 1000, 3, 10, 'admin', 'baseball', 'MD5', '', 'DES', '', ''),
(2, 1, 2, '2', 'private', 161, 1000, 3, 10, 'admin', 'baseball', 'MD5', '', 'DES', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `automation_templates`
--

CREATE TABLE `automation_templates` (
  `id` int(8) NOT NULL,
  `host_template` int(8) NOT NULL DEFAULT '0',
  `availability_method` int(10) UNSIGNED DEFAULT '2',
  `sysDescr` varchar(255) DEFAULT '',
  `sysName` varchar(255) DEFAULT '',
  `sysOid` varchar(60) DEFAULT '',
  `sequence` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Templates of SNMP Sys variables used for automation';

--
-- Dumping data for table `automation_templates`
--

INSERT INTO `automation_templates` (`id`, `host_template`, `availability_method`, `sysDescr`, `sysName`, `sysOid`, `sequence`) VALUES
(1, 3, 2, 'Linux', '', '', 2),
(2, 1, 2, 'HP ETHERNET', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `automation_tree_rules`
--

CREATE TABLE `automation_tree_rules` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `tree_id` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `tree_item_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `leaf_type` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `host_grouping_type` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `enabled` char(2) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Automation Tree Rules';

--
-- Dumping data for table `automation_tree_rules`
--

INSERT INTO `automation_tree_rules` (`id`, `name`, `tree_id`, `tree_item_id`, `leaf_type`, `host_grouping_type`, `enabled`) VALUES
(1, 'New Device', 1, 0, 3, 0, ''),
(2, 'New Graph', 1, 0, 2, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `automation_tree_rule_items`
--

CREATE TABLE `automation_tree_rule_items` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `rule_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `field` varchar(255) NOT NULL DEFAULT '',
  `sort_type` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `propagate_changes` char(2) DEFAULT '',
  `search_pattern` varchar(255) NOT NULL DEFAULT '',
  `replace_pattern` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Automation Tree Rule Items';

--
-- Dumping data for table `automation_tree_rule_items`
--

INSERT INTO `automation_tree_rule_items` (`id`, `rule_id`, `sequence`, `field`, `sort_type`, `propagate_changes`, `search_pattern`, `replace_pattern`) VALUES
(1, 1, 1, 'ht.name', 1, '', '^(.*)\\s*Linux\\s*(.*)$', '${1}\\n${2}'),
(2, 1, 2, 'h.hostname', 1, '', '^(\\w*)\\s*(\\w*)\\s*(\\w*).*$', ''),
(3, 2, 1, '0', 2, 'on', 'Traffic', ''),
(4, 2, 2, 'gtg.title_cache', 1, '', '^(.*)\\s*-\\s*Traffic -\\s*(.*)$', '${1}\\n${2}');

-- --------------------------------------------------------

--
-- Table structure for table `cdef`
--

CREATE TABLE `cdef` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `system` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdef`
--

INSERT INTO `cdef` (`id`, `hash`, `system`, `name`) VALUES
(2, '73f95f8b77b5508157d64047342c421e', 0, 'Turn Bytes into Bits'),
(3, '3d352eed9fa8f7b2791205b3273708c7', 0, 'Make Stack Negative'),
(4, 'e961cc8ec04fda6ed4981cf5ad501aa5', 0, 'Make Per 5 Minutes'),
(12, 'f1ac79f05f255c02f914c920f1038c54', 0, 'Total All Data Sources'),
(14, '634a23af5e78af0964e8d33b1a4ed26b', 0, 'Multiply by 1024'),
(15, '068984b5ccdfd2048869efae5166f722', 0, 'Total All Data Sources, Multiply by 1024');

-- --------------------------------------------------------

--
-- Table structure for table `cdef_items`
--

CREATE TABLE `cdef_items` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `cdef_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdef_items`
--

INSERT INTO `cdef_items` (`id`, `hash`, `cdef_id`, `sequence`, `type`, `value`) VALUES
(7, '9bbf6b792507bb9bb17d2af0970f9be9', 2, 1, 4, 'CURRENT_DATA_SOURCE'),
(8, 'caa4e023ac2d7b1c4b4c8c4adfd55dfe', 2, 3, 2, '3'),
(9, 'a4b8eb2c3bf4920a3ef571a7a004be53', 2, 2, 6, '8'),
(10, 'c888c9fe6b62c26c4bfe23e18991731d', 3, 1, 4, 'CURRENT_DATA_SOURCE'),
(11, '1e1d0b29a94e08b648c8f053715442a0', 3, 3, 2, '3'),
(12, '4355c197998c7f8b285be7821ddc6da4', 3, 2, 6, '-1'),
(13, '40bb7a1143b0f2e2efca14eb356236de', 4, 1, 4, 'CURRENT_DATA_SOURCE'),
(14, '42686ea0925c0220924b7d333599cd67', 4, 3, 2, '3'),
(15, 'faf1b148b2c0e0527362ed5b8ca1d351', 4, 2, 6, '300'),
(16, '0ef6b8a42dc83b4e43e437960fccd2ea', 12, 1, 4, 'ALL_DATA_SOURCES_NODUPS'),
(18, '86370cfa0008fe8c56b28be80ee39a40', 14, 1, 4, 'CURRENT_DATA_SOURCE'),
(19, '9a35cc60d47691af37f6fddf02064e20', 14, 2, 6, '1024'),
(20, '5d7a7941ec0440b257e5598a27dd1688', 14, 3, 2, '3'),
(21, '44fd595c60539ff0f5817731d9f43a85', 15, 1, 4, 'ALL_DATA_SOURCES_NODUPS'),
(22, 'aa38be265e5ac31783e57ce6f9314e9a', 15, 2, 6, '1024'),
(23, '204423d4b2598f1f7252eea19458345c', 15, 3, 2, '3');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT '',
  `hex` varchar(6) NOT NULL DEFAULT '',
  `read_only` char(2) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `hex`, `read_only`) VALUES
(1, 'Black', '000000', 'on'),
(2, 'White', 'FFFFFF', 'on'),
(4, '', 'FAFD9E', ''),
(5, '', 'C0C0C0', ''),
(6, '', '74C366', ''),
(7, '', '6DC8FE', ''),
(8, '', 'EA8F00', ''),
(9, 'Red', 'FF0000', 'on'),
(10, '', '4444FF', ''),
(11, 'Magenta', 'FF00FF', 'on'),
(12, 'Green', '00FF00', 'on'),
(13, '', '8D85F3', ''),
(14, '', 'AD3B6E', ''),
(15, '', 'EACC00', ''),
(16, '', '12B3B5', ''),
(17, '', '157419', ''),
(18, '', 'C4FD3D', ''),
(19, '', '817C4E', ''),
(20, '', '002A97', ''),
(21, '', '0000FF', ''),
(22, '', '00CF00', ''),
(24, '', 'F9FD5F', ''),
(25, '', 'FFF200', ''),
(26, '', 'CCBB00', ''),
(27, '', '837C04', ''),
(28, '', 'EAAF00', ''),
(29, '', 'FFD660', ''),
(30, '', 'FFC73B', ''),
(31, '', 'FFAB00', ''),
(33, '', 'FF7D00', ''),
(34, '', 'ED7600', ''),
(35, '', 'FF5700', ''),
(36, '', 'EE5019', ''),
(37, '', 'B1441E', ''),
(38, '', 'FFC3C0', ''),
(39, '', 'FF897C', ''),
(40, '', 'FF6044', ''),
(41, '', 'FF4105', ''),
(42, '', 'DA4725', ''),
(43, '', '942D0C', ''),
(44, '', 'FF3932', ''),
(45, '', '862F2F', ''),
(46, '', 'FF5576', ''),
(47, '', '562B29', ''),
(48, '', 'F51D30', ''),
(49, '', 'DE0056', ''),
(50, '', 'ED5394', ''),
(51, '', 'B90054', ''),
(52, '', '8F005C', ''),
(53, '', 'F24AC8', ''),
(54, '', 'E8CDEF', ''),
(55, '', 'D8ACE0', ''),
(56, '', 'A150AA', ''),
(57, '', '750F7D', ''),
(58, '', '8D00BA', ''),
(59, '', '623465', ''),
(60, '', '55009D', ''),
(61, '', '3D168B', ''),
(62, '', '311F4E', ''),
(63, '', 'D2D8F9', ''),
(64, '', '9FA4EE', ''),
(65, '', '6557D0', ''),
(66, '', '4123A1', ''),
(67, '', '4668E4', ''),
(68, '', '0D006A', ''),
(69, '', '00004D', ''),
(70, '', '001D61', ''),
(71, '', '00234B', ''),
(72, '', '002A8F', ''),
(73, '', '2175D9', ''),
(74, '', '7CB3F1', ''),
(75, '', '005199', ''),
(76, '', '004359', ''),
(77, '', '00A0C1', ''),
(78, '', '007283', ''),
(79, '', '00BED9', ''),
(80, '', 'AFECED', ''),
(81, '', '55D6D3', ''),
(82, '', '00BBB4', ''),
(83, '', '009485', ''),
(84, '', '005D57', ''),
(85, '', '008A77', ''),
(86, '', '008A6D', ''),
(87, '', '00B99B', ''),
(88, '', '009F67', ''),
(89, '', '00694A', ''),
(90, '', '00A348', ''),
(91, '', '00BF47', ''),
(92, '', '96E78A', ''),
(93, '', '00BD27', ''),
(94, '', '35962B', ''),
(95, '', '7EE600', ''),
(96, '', '6EA100', ''),
(97, '', 'CAF100', ''),
(98, '', 'F5F800', ''),
(99, '', 'CDCFC4', ''),
(100, '', 'BCBEB3', ''),
(101, '', 'AAABA1', ''),
(102, '', '8F9286', ''),
(103, '', '797C6E', ''),
(104, '', '2E3127', ''),
(105, 'Night', '0C090A', 'on'),
(106, 'Gunmetal', '2C3539', 'on'),
(107, 'Midnight', '2B1B17', 'on'),
(108, 'Charcoal', '34282C', 'on'),
(109, 'Dark Slate Grey', '25383C', 'on'),
(110, 'Oil', '3B3131', 'on'),
(111, 'Black Cat', '413839', 'on'),
(112, 'Iridium', '3D3C3A', 'on'),
(113, 'Black Eel', '463E3F', 'on'),
(114, 'Black Cow', '4C4646', 'on'),
(115, 'Gray Wolf', '504A4B', 'on'),
(116, 'Vampire Gray', '565051', 'on'),
(117, 'Gray Dolphin', '5C5858', 'on'),
(118, 'Carbon Gray', '625D5D', 'on'),
(119, 'Ash Gray', '666362', 'on'),
(120, 'Cloudy Gray', '6D6968', 'on'),
(121, 'Smokey Gray', '726E6D', 'on'),
(122, 'Gray', '736F6E', 'on'),
(123, 'Granite', '837E7C', 'on'),
(124, 'Battleship Gray', '848482', 'on'),
(125, 'Gray Cloud', 'B6B6B4', 'on'),
(126, 'Gray Goose', 'D1D0CE', 'on'),
(127, 'Platinum', 'E5E4E2', 'on'),
(128, 'Metallic Silver', 'BCC6CC', 'on'),
(129, 'Blue Gray', '98AFC7', 'on'),
(130, 'Light Slate Gray', '6D7B8D', 'on'),
(131, 'Slate Gray', '657383', 'on'),
(132, 'Jet Gray', '616D7E', 'on'),
(133, 'Mist Blue', '646D7E', 'on'),
(134, 'Marble Blue', '566D7E', 'on'),
(135, 'Slate Blue', '737CA1', 'on'),
(136, 'Steel Blue', '4863A0', 'on'),
(137, 'Blue Jay', '2B547E', 'on'),
(138, 'Dark Slate Blue', '2B3856', 'on'),
(139, 'Midnight Blue', '151B54', 'on'),
(140, 'Navy Blue', '000080', 'on'),
(141, 'Blue Whale', '342D7E', 'on'),
(142, 'Lapis Blue', '15317E', 'on'),
(143, 'Cornflower Blue', '151B8D', 'on'),
(144, 'Earth Blue', '0000A0', 'on'),
(145, 'Cobalt Blue', '0020C2', 'on'),
(146, 'Blueberry Blue', '0041C2', 'on'),
(147, 'Sapphire Blue', '2554C7', 'on'),
(148, 'Blue Eyes', '1569C7', 'on'),
(149, 'Royal Blue', '2B60DE', 'on'),
(150, 'Blue Orchid', '1F45FC', 'on'),
(151, 'Blue Lotus', '6960EC', 'on'),
(152, 'Light Slate Blue', '736AFF', 'on'),
(153, 'Slate Blue', '357EC7', 'on'),
(154, 'Glacial Blue Ice', '368BC1', 'on'),
(155, 'Silk Blue', '488AC7', 'on'),
(156, 'Blue Ivy', '3090C7', 'on'),
(157, 'Blue Koi', '659EC7', 'on'),
(158, 'Columbia Blue', '87AFC7', 'on'),
(159, 'Baby Blue', '95B9C7', 'on'),
(160, 'Light Steel Blue', '728FCE', 'on'),
(161, 'Ocean Blue', '2B65EC', 'on'),
(162, 'Blue Ribbon', '306EFF', 'on'),
(163, 'Blue Dress', '157DEC', 'on'),
(164, 'Dodger Blue', '1589FF', 'on'),
(165, 'Cornflower Blue', '6495ED', 'on'),
(166, 'Sky Blue', '6698FF', 'on'),
(167, 'Butterfly Blue', '38ACEC', 'on'),
(168, 'Iceberg', '56A5EC', 'on'),
(169, 'Crystal Blue', '5CB3FF', 'on'),
(170, 'Deep Sky Blue', '3BB9FF', 'on'),
(171, 'Denim Blue', '79BAEC', 'on'),
(172, 'Light Sky Blue', '82CAFA', 'on'),
(173, 'Day Sky Blue', '82CAFF', 'on'),
(174, 'Jeans Blue', 'A0CFEC', 'on'),
(175, 'Blue Angel', 'B7CEEC', 'on'),
(176, 'Pastel Blue', 'B4CFEC', 'on'),
(177, 'Sea Blue', 'C2DFFF', 'on'),
(178, 'Powder Blue', 'C6DEFF', 'on'),
(179, 'Coral Blue', 'AFDCEC', 'on'),
(180, 'Light Blue', 'ADDFFF', 'on'),
(181, 'Robin Egg Blue', 'BDEDFF', 'on'),
(182, 'Pale Blue Lily', 'CFECEC', 'on'),
(183, 'Light Cyan', 'E0FFFF', 'on'),
(184, 'Water', 'EBF4FA', 'on'),
(185, 'Alice Blue', 'F0F8FF', 'on'),
(186, 'Azure', 'F0FFFF', 'on'),
(187, 'Light Slate', 'CCFFFF', 'on'),
(188, 'Light Aquamarine', '93FFE8', 'on'),
(189, 'Electric Blue', '9AFEFF', 'on'),
(190, 'Aquamarine', '7FFFD4', 'on'),
(191, 'Cyan or Aqua', '00FFFF', 'on'),
(192, 'Tron Blue', '7DFDFE', 'on'),
(193, 'Blue Zircon', '57FEFF', 'on'),
(194, 'Blue Lagoon', '8EEBEC', 'on'),
(195, 'Celeste', '50EBEC', 'on'),
(196, 'Blue Diamond', '4EE2EC', 'on'),
(197, 'Tiffany Blue', '81D8D0', 'on'),
(198, 'Cyan Opaque', '92C7C7', 'on'),
(199, 'Blue Hosta', '77BFC7', 'on'),
(200, 'Northern Lights Blue', '78C7C7', 'on'),
(201, 'Medium Turquoise', '48CCCD', 'on'),
(202, 'Turquoise', '43C6DB', 'on'),
(203, 'Jellyfish', '46C7C7', 'on'),
(204, 'Macaw Blue Green', '43BFC7', 'on'),
(205, 'Light Sea Green', '3EA99F', 'on'),
(206, 'Dark Turquoise', '3B9C9C', 'on'),
(207, 'Sea Turtle Green', '438D80', 'on'),
(208, 'Medium Aquamarine', '348781', 'on'),
(209, 'Greenish Blue', '307D7E', 'on'),
(210, 'Grayish Turquoise', '5E7D7E', 'on'),
(211, 'Beetle Green', '4C787E', 'on'),
(212, 'Teal', '008080', 'on'),
(213, 'Sea Green', '4E8975', 'on'),
(214, 'Camouflage Green', '78866B', 'on'),
(215, 'Sage Green', '848b79', 'on'),
(216, 'Hazel Green', '617C58', 'on'),
(217, 'Venom Green', '728C00', 'on'),
(218, 'Fern Green', '667C26', 'on'),
(219, 'Dark Forrest Green', '254117', 'on'),
(220, 'Medium Sea Green', '306754', 'on'),
(221, 'Medium Forest Green', '347235', 'on'),
(222, 'Seaweed Green', '437C17', 'on'),
(223, 'Pine Green', '387C44', 'on'),
(224, 'Jungle Green', '347C2C', 'on'),
(225, 'Shamrock Green', '347C17', 'on'),
(226, 'Medium Spring Green', '348017', 'on'),
(227, 'Forest Green', '4E9258', 'on'),
(228, 'Green Onion', '6AA121', 'on'),
(229, 'Spring Green', '4AA02C', 'on'),
(230, 'Lime Green', '41A317', 'on'),
(231, 'Clover Green', '3EA055', 'on'),
(232, 'Green Snake', '6CBB3C', 'on'),
(233, 'Alien Green', '6CC417', 'on'),
(234, 'Green Apple', '4CC417', 'on'),
(235, 'Yellow Green', '52D017', 'on'),
(236, 'Kelly Green', '4CC552', 'on'),
(237, 'Zombie Green', '54C571', 'on'),
(238, 'Frog Green', '99C68E', 'on'),
(239, 'Green Peas', '89C35C', 'on'),
(240, 'Dollar Bill Green', '85BB65', 'on'),
(241, 'Dark Sea Green', '8BB381', 'on'),
(242, 'Iguana Green', '9CB071', 'on'),
(243, 'Avocado Green', 'B2C248', 'on'),
(244, 'Pistachio Green', '9DC209', 'on'),
(245, 'Salad Green', 'A1C935', 'on'),
(246, 'Hummingbird Green', '7FE817', 'on'),
(247, 'Nebula Green', '59E817', 'on'),
(248, 'Stoplight Go Green', '57E964', 'on'),
(249, 'Algae Green', '64E986', 'on'),
(250, 'Jade Green', '5EFB6E', 'on'),
(251, 'Emerald Green', '5FFB17', 'on'),
(252, 'Lawn Green', '87F717', 'on'),
(253, 'Chartreuse', '8AFB17', 'on'),
(254, 'Dragon Green', '6AFB92', 'on'),
(255, 'Mint green', '98FF98', 'on'),
(256, 'Green Thumb', 'B5EAAA', 'on'),
(257, 'Light Jade', 'C3FDB8', 'on'),
(258, 'Tea Green', 'CCFB5D', 'on'),
(259, 'Green Yellow', 'B1FB17', 'on'),
(260, 'Slime Green', 'BCE954', 'on'),
(261, 'Goldenrod', 'EDDA74', 'on'),
(262, 'Harvest Gold', 'EDE275', 'on'),
(263, 'Sun Yellow', 'FFE87C', 'on'),
(264, 'Yellow', 'FFFF00', 'on'),
(265, 'Corn Yellow', 'FFF380', 'on'),
(266, 'Parchment', 'FFFFC2', 'on'),
(267, 'Cream', 'FFFFCC', 'on'),
(268, 'Lemon Chiffon', 'FFF8C6', 'on'),
(269, 'Cornsilk', 'FFF8DC', 'on'),
(270, 'Beige', 'F5F5DC', 'on'),
(271, 'Blonde', 'FBF6D9', 'on'),
(272, 'Antique White', 'FAEBD7', 'on'),
(273, 'Champagne', 'F7E7CE', 'on'),
(274, 'Blanched Almond', 'FFEBCD', 'on'),
(275, 'Vanilla', 'F3E5AB', 'on'),
(276, 'Tan Brown', 'ECE5B6', 'on'),
(277, 'Peach', 'FFE5B4', 'on'),
(278, 'Mustard', 'FFDB58', 'on'),
(279, 'Rubber Ducky Yellow', 'FFD801', 'on'),
(280, 'Bright Gold', 'FDD017', 'on'),
(281, 'Golden Brown', 'EAC117', 'on'),
(282, 'Macaroni and Cheese', 'F2BB66', 'on'),
(283, 'Saffron', 'FBB917', 'on'),
(284, 'Beer', 'FBB117', 'on'),
(285, 'Cantaloupe', 'FFA62F', 'on'),
(286, 'Bee Yellow', 'E9AB17', 'on'),
(287, 'Brown Sugar', 'E2A76F', 'on'),
(288, 'BurlyWood', 'DEB887', 'on'),
(289, 'Deep Peach', 'FFCBA4', 'on'),
(290, 'Ginger Brown', 'C9BE62', 'on'),
(291, 'School Bus Yellow', 'E8A317', 'on'),
(292, 'Sandy Brown', 'EE9A4D', 'on'),
(293, 'Fall Leaf Brown', 'C8B560', 'on'),
(294, 'Orange Gold', 'D4A017', 'on'),
(295, 'Sand', 'C2B280', 'on'),
(296, 'Cookie Brown', 'C7A317', 'on'),
(297, 'Caramel', 'C68E17', 'on'),
(298, 'Brass', 'B5A642', 'on'),
(299, 'Khaki', 'ADA96E', 'on'),
(300, 'Camel Brown', 'C19A6B', 'on'),
(301, 'Bronze', 'CD7F32', 'on'),
(302, 'Tiger Orange', 'C88141', 'on'),
(303, 'Cinnamon', 'C58917', 'on'),
(304, 'Bullet Shell', 'AF9B60', 'on'),
(305, 'Dark Goldenrod', 'AF7817', 'on'),
(306, 'Copper', 'B87333', 'on'),
(307, 'Wood', '966F33', 'on'),
(308, 'Oak Brown', '806517', 'on'),
(309, 'Moccasin', '827839', 'on'),
(310, 'Army Brown', '827B60', 'on'),
(311, 'Sandstone', '786D5F', 'on'),
(312, 'Mocha', '493D26', 'on'),
(313, 'Taupe', '483C32', 'on'),
(314, 'Coffee', '6F4E37', 'on'),
(315, 'Brown Bear', '835C3B', 'on'),
(316, 'Red Dirt', '7F5217', 'on'),
(317, 'Sepia', '7F462C', 'on'),
(318, 'Orange Salmon', 'C47451', 'on'),
(319, 'Rust', 'C36241', 'on'),
(320, 'Red Fox', 'C35817', 'on'),
(321, 'Chocolate', 'C85A17', 'on'),
(322, 'Sedona', 'CC6600', 'on'),
(323, 'Papaya Orange', 'E56717', 'on'),
(324, 'Halloween Orange', 'E66C2C', 'on'),
(325, 'Pumpkin Orange', 'F87217', 'on'),
(326, 'Construction Cone Orange', 'F87431', 'on'),
(327, 'Sunrise Orange', 'E67451', 'on'),
(328, 'Mango Orange', 'FF8040', 'on'),
(329, 'Dark Orange', 'F88017', 'on'),
(330, 'Coral', 'FF7F50', 'on'),
(331, 'Basket Ball Orange', 'F88158', 'on'),
(332, 'Light Salmon', 'F9966B', 'on'),
(333, 'Tangerine', 'E78A61', 'on'),
(334, 'Dark Salmon', 'E18B6B', 'on'),
(335, 'Light Coral', 'E77471', 'on'),
(336, 'Bean Red', 'F75D59', 'on'),
(337, 'Valentine Red', 'E55451', 'on'),
(338, 'Shocking Orange', 'E55B3C', 'on'),
(339, 'Scarlet', 'FF2400', 'on'),
(340, 'Ruby Red', 'F62217', 'on'),
(341, 'Ferrari Red', 'F70D1A', 'on'),
(342, 'Fire Engine Red', 'F62817', 'on'),
(343, 'Lava Red', 'E42217', 'on'),
(344, 'Love Red', 'E41B17', 'on'),
(345, 'Grapefruit', 'DC381F', 'on'),
(346, 'Chestnut Red', 'C34A2C', 'on'),
(347, 'Cherry Red', 'C24641', 'on'),
(348, 'Mahogany', 'C04000', 'on'),
(349, 'Chilli Pepper', 'C11B17', 'on'),
(350, 'Cranberry', '9F000F', 'on'),
(351, 'Red Wine', '990012', 'on'),
(352, 'Burgundy', '8C001A', 'on'),
(353, 'Chestnut', '954535', 'on'),
(354, 'Blood Red', '7E3517', 'on'),
(355, 'Sienna', '8A4117', 'on'),
(356, 'Sangria', '7E3817', 'on'),
(357, 'Firebrick', '800517', 'on'),
(358, 'Maroon', '810541', 'on'),
(359, 'Plum Pie', '7D0541', 'on'),
(360, 'Velvet Maroon', '7E354D', 'on'),
(361, 'Plum Velvet', '7D0552', 'on'),
(362, 'Rosy Finch', '7F4E52', 'on'),
(363, 'Puce', '7F5A58', 'on'),
(364, 'Dull Purple', '7F525D', 'on'),
(365, 'Rosy Brown', 'B38481', 'on'),
(366, 'Khaki Rose', 'C5908E', 'on'),
(367, 'Pink Bow', 'C48189', 'on'),
(368, 'Lipstick Pink', 'C48793', 'on'),
(369, 'Rose', 'E8ADAA', 'on'),
(370, 'Desert Sand', 'EDC9AF', 'on'),
(371, 'Pig Pink', 'FDD7E4', 'on'),
(372, 'Cotton Candy', 'FCDFFF', 'on'),
(373, 'Pink Bubblegum', 'FFDFDD', 'on'),
(374, 'Misty Rose', 'FBBBB9', 'on'),
(375, 'Pink', 'FAAFBE', 'on'),
(376, 'Light Pink', 'FAAFBA', 'on'),
(377, 'Flamingo Pink', 'F9A7B0', 'on'),
(378, 'Pink Rose', 'E7A1B0', 'on'),
(379, 'Pink Daisy', 'E799A3', 'on'),
(380, 'Cadillac Pink', 'E38AAE', 'on'),
(381, 'Carnation Pink', 'F778A1', 'on'),
(382, 'Blush Red', 'E56E94', 'on'),
(383, 'Hot Pink', 'F660AB', 'on'),
(384, 'Watermelon Pink', 'FC6C85', 'on'),
(385, 'Violet Red', 'F6358A', 'on'),
(386, 'Deep Pink', 'F52887', 'on'),
(387, 'Pink Cupcake', 'E45E9D', 'on'),
(388, 'Pink Lemonade', 'E4287C', 'on'),
(389, 'Neon Pink', 'F535AA', 'on'),
(390, 'Dimorphotheca Magenta', 'E3319D', 'on'),
(391, 'Bright Neon Pink', 'F433FF', 'on'),
(392, 'Pale Violet Red', 'D16587', 'on'),
(393, 'Tulip Pink', 'C25A7C', 'on'),
(394, 'Medium Violet Red', 'CA226B', 'on'),
(395, 'Rogue Pink', 'C12869', 'on'),
(396, 'Burnt Pink', 'C12267', 'on'),
(397, 'Bashful Pink', 'C25283', 'on'),
(398, 'Carnation Pink', 'C12283', 'on'),
(399, 'Plum', 'B93B8F', 'on'),
(400, 'Viola Purple', '7E587E', 'on'),
(401, 'Purple Iris', '571B7E', 'on'),
(402, 'Plum Purple', '583759', 'on'),
(403, 'Indigo', '4B0082', 'on'),
(404, 'Purple Monster', '461B7E', 'on'),
(405, 'Purple Haze', '4E387E', 'on'),
(406, 'Eggplant', '614051', 'on'),
(407, 'Grape', '5E5A80', 'on'),
(408, 'Purple Jam', '6A287E', 'on'),
(409, 'Dark Orchid', '7D1B7E', 'on'),
(410, 'Purple Flower', 'A74AC7', 'on'),
(411, 'Medium Orchid', 'B048B5', 'on'),
(412, 'Purple Amethyst', '6C2DC7', 'on'),
(413, 'Dark Violet', '842DCE', 'on'),
(414, 'Violet', '8D38C9', 'on'),
(415, 'Purple Sage Bush', '7A5DC7', 'on'),
(416, 'Lovely Purple', '7F38EC', 'on'),
(417, 'Purple', '8E35EF', 'on'),
(418, 'Aztech Purple', '893BFF', 'on'),
(419, 'Medium Purple', '8467D7', 'on'),
(420, 'Jasmine Purple', 'A23BEC', 'on'),
(421, 'Purple Daffodil', 'B041FF', 'on'),
(422, 'Tyrian Purple', 'C45AEC', 'on'),
(423, 'Crocus Purple', '9172EC', 'on'),
(424, 'Purple Mimosa', '9E7BFF', 'on'),
(425, 'Heliotrope Purple', 'D462FF', 'on'),
(426, 'Crimson', 'E238EC', 'on'),
(427, 'Purple Dragon', 'C38EC7', 'on'),
(428, 'Lilac', 'C8A2C8', 'on'),
(429, 'Blush Pink', 'E6A9EC', 'on'),
(430, 'Mauve', 'E0B0FF', 'on'),
(431, 'Wisteria Purple', 'C6AEC7', 'on'),
(432, 'Blossom Pink', 'F9B7FF', 'on'),
(433, 'Thistle', 'D2B9D3', 'on'),
(434, 'Periwinkle', 'E9CFEC', 'on'),
(435, 'Lavender Pinocchio', 'EBDDE2', 'on'),
(436, 'Lavender Blue', 'E3E4FA', 'on'),
(437, 'Pearl', 'FDEEF4', 'on'),
(438, 'SeaShell', 'FFF5EE', 'on'),
(439, 'Milk White', 'FEFCFF', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `color_templates`
--

CREATE TABLE `color_templates` (
  `color_template_id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Color Templates';

--
-- Dumping data for table `color_templates`
--

INSERT INTO `color_templates` (`color_template_id`, `name`) VALUES
(1, 'Yellow: light -> dark, 4 colors'),
(2, 'Red: light yellow > dark red, 8 colors'),
(3, 'Red: light -> dark, 16 colors'),
(4, 'Green: dark -> light, 16 colors');

-- --------------------------------------------------------

--
-- Table structure for table `color_template_items`
--

CREATE TABLE `color_template_items` (
  `color_template_item_id` int(12) UNSIGNED NOT NULL,
  `color_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `color_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Color Items for Color Templates';

--
-- Dumping data for table `color_template_items`
--

INSERT INTO `color_template_items` (`color_template_item_id`, `color_template_id`, `color_id`, `sequence`) VALUES
(1, 1, 4, 1),
(2, 1, 24, 2),
(3, 1, 98, 3),
(4, 1, 25, 4),
(5, 2, 25, 1),
(6, 2, 29, 2),
(7, 2, 30, 3),
(8, 2, 31, 4),
(9, 2, 33, 5),
(10, 2, 35, 6),
(11, 2, 41, 7),
(12, 2, 9, 8),
(13, 3, 15, 1),
(14, 3, 31, 2),
(15, 3, 28, 3),
(16, 3, 8, 4),
(17, 3, 34, 5),
(18, 3, 33, 6),
(19, 3, 35, 7),
(20, 3, 41, 8),
(21, 3, 36, 9),
(22, 3, 42, 10),
(23, 3, 44, 11),
(24, 3, 48, 12),
(25, 3, 9, 13),
(26, 3, 49, 14),
(27, 3, 51, 15),
(28, 3, 52, 16),
(29, 4, 76, 1),
(30, 4, 84, 2),
(31, 4, 89, 3),
(32, 4, 17, 4),
(33, 4, 86, 5),
(34, 4, 88, 6),
(35, 4, 90, 7),
(36, 4, 94, 8),
(37, 4, 96, 9),
(38, 4, 93, 10),
(39, 4, 91, 11),
(40, 4, 22, 12),
(41, 4, 12, 13),
(42, 4, 95, 14),
(43, 4, 6, 15),
(44, 4, 92, 16);

-- --------------------------------------------------------

--
-- Table structure for table `data_input`
--

CREATE TABLE `data_input` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `input_string` varchar(512) DEFAULT NULL,
  `type_id` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_input`
--

INSERT INTO `data_input` (`id`, `hash`, `name`, `input_string`, `type_id`) VALUES
(1, '3eb92bb845b9660a7445cf9740726522', 'Get SNMP Data', '', 2),
(2, 'bf566c869ac6443b0c75d1c32b5a350e', 'Get SNMP Data (Indexed)', '', 3),
(3, '274f4685461170b9eb1b98d22567ab5e', 'Unix - Get Free Disk Space', '<path_cacti>/scripts/diskfree.sh <partition>', 1),
(4, '95ed0993eb3095f9920d431ac80f4231', 'Unix - Get Load Average', 'perl <path_cacti>/scripts/loadavg_multi.pl', 1),
(5, '79a284e136bb6b061c6f96ec219ac448', 'Unix - Get Logged In Users', 'perl <path_cacti>/scripts/unix_users.pl <username>', 1),
(6, '362e6d4768937c4f899dd21b91ef0ff8', 'Linux - Get Memory Usage', 'perl <path_cacti>/scripts/linux_memory.pl <grepstr>', 1),
(7, 'a637359e0a4287ba43048a5fdf202066', 'Unix - Get System Processes', 'perl <path_cacti>/scripts/unix_processes.pl', 1),
(8, '47d6bfe8be57a45171afd678920bd399', 'Unix - Get TCP Connections', 'perl <path_cacti>/scripts/unix_tcp_connections.pl <grepstr>', 1),
(9, 'cc948e4de13f32b6aea45abaadd287a3', 'Unix - Get Web Hits', 'perl <path_cacti>/scripts/webhits.pl <log_path>', 1),
(10, '8bd153aeb06e3ff89efc73f35849a7a0', 'Unix - Ping Host', 'perl <path_cacti>/scripts/ping.pl <ip>', 1),
(11, '80e9e4c4191a5da189ae26d0e237f015', 'Get Script Data (Indexed)', '', 4),
(12, '332111d8b54ac8ce939af87a7eac0c06', 'Get Script Server Data (Indexed)', '', 6);

-- --------------------------------------------------------

--
-- Table structure for table `data_input_data`
--

CREATE TABLE `data_input_data` (
  `data_input_field_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `data_template_data_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `t_value` char(2) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_input_data`
--

INSERT INTO `data_input_data` (`data_input_field_id`, `data_template_data_id`, `t_value`, `value`) VALUES
(1, 4, '', ''),
(1, 5, '', ''),
(1, 6, '', ''),
(1, 10, '', ''),
(1, 11, '', ''),
(1, 12, '', ''),
(1, 13, '', ''),
(1, 19, '', ''),
(1, 20, '', ''),
(1, 22, '', ''),
(1, 23, '', ''),
(1, 24, '', ''),
(1, 25, '', ''),
(1, 26, '', ''),
(1, 27, '', ''),
(1, 30, '', ''),
(1, 31, '', ''),
(1, 32, '', ''),
(1, 33, '', ''),
(1, 34, '', ''),
(1, 58, '', ''),
(1, 59, '', ''),
(1, 68, '', ''),
(2, 4, '', ''),
(2, 5, '', ''),
(2, 6, '', ''),
(2, 10, '', ''),
(2, 11, '', ''),
(2, 12, '', ''),
(2, 13, '', ''),
(2, 19, '', ''),
(2, 20, '', ''),
(2, 22, '', ''),
(2, 23, '', ''),
(2, 24, '', ''),
(2, 25, '', ''),
(2, 26, '', ''),
(2, 27, '', ''),
(2, 30, '', ''),
(2, 31, '', ''),
(2, 32, '', ''),
(2, 33, '', ''),
(2, 34, '', ''),
(2, 58, '', ''),
(2, 59, '', ''),
(2, 68, '', ''),
(3, 4, '', ''),
(3, 5, '', ''),
(3, 6, '', ''),
(3, 10, '', ''),
(3, 11, '', ''),
(3, 12, '', ''),
(3, 13, '', ''),
(3, 19, '', ''),
(3, 20, '', ''),
(3, 22, '', ''),
(3, 23, '', ''),
(3, 24, '', ''),
(3, 25, '', ''),
(3, 26, '', ''),
(3, 27, '', ''),
(3, 30, '', ''),
(20, 3, '', ''),
(20, 9, '', ''),
(20, 15, '', ''),
(22, 4, '', 'MemFree:'),
(22, 5, '', 'SwapFree:'),
(22, 10, '', 'MemFree:'),
(22, 11, '', 'SwapFree:'),
(22, 12, '', 'MemFree:'),
(22, 13, '', 'SwapFree:'),
(31, 6, 'on', ''),
(32, 6, 'on', ''),
(33, 6, 'on', '');

-- --------------------------------------------------------

--
-- Table structure for table `data_input_fields`
--

CREATE TABLE `data_input_fields` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `data_input_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `data_name` varchar(50) NOT NULL DEFAULT '',
  `input_output` char(3) NOT NULL DEFAULT '',
  `update_rra` char(2) DEFAULT '0',
  `sequence` smallint(5) NOT NULL DEFAULT '0',
  `type_code` varchar(40) DEFAULT NULL,
  `regexp_match` varchar(200) DEFAULT NULL,
  `allow_nulls` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_input_fields`
--

INSERT INTO `data_input_fields` (`id`, `hash`, `data_input_id`, `name`, `data_name`, `input_output`, `update_rra`, `sequence`, `type_code`, `regexp_match`, `allow_nulls`) VALUES
(1, '92f5906c8dc0f964b41f4253df582c38', 1, 'SNMP IP Address', 'management_ip', 'in', '', 0, 'hostname', '', ''),
(2, '32285d5bf16e56c478f5e83f32cda9ef', 1, 'SNMP Community', 'snmp_community', 'in', '', 0, 'snmp_community', '', ''),
(3, 'ad14ac90641aed388139f6ba86a2e48b', 1, 'SNMP Username', 'snmp_username', 'in', '', 0, 'snmp_username', '', 'on'),
(4, '9c55a74bd571b4f00a96fd4b793278c6', 1, 'SNMP Password', 'snmp_password', 'in', '', 0, 'snmp_password', '', 'on'),
(5, '012ccb1d3687d3edb29c002ea66e72da', 1, 'SNMP Version (1, 2, or 3)', 'snmp_version', 'in', '', 0, 'snmp_version', '', 'on'),
(6, '4276a5ec6e3fe33995129041b1909762', 1, 'OID', 'oid', 'in', '', 0, 'snmp_oid', '', ''),
(7, '617cdc8a230615e59f06f361ef6e7728', 2, 'SNMP IP Address', 'management_ip', 'in', '', 0, 'hostname', '', ''),
(8, 'acb449d1451e8a2a655c2c99d31142c7', 2, 'SNMP Community', 'snmp_community', 'in', '', 0, 'snmp_community', '', ''),
(9, 'f4facc5e2ca7ebee621f09bc6d9fc792', 2, 'SNMP Username (v3)', 'snmp_username', 'in', '', 0, 'snmp_username', '', 'on'),
(10, '1cc1493a6781af2c478fa4de971531cf', 2, 'SNMP Password (v3)', 'snmp_password', 'in', '', 0, 'snmp_password', '', 'on'),
(11, 'b5c23f246559df38662c255f4aa21d6b', 2, 'SNMP Version (1, 2, or 3)', 'snmp_version', 'in', '', 0, 'snmp_version', '', ''),
(12, '6027a919c7c7731fbe095b6f53ab127b', 2, 'Index Type', 'index_type', 'in', '', 0, 'index_type', '', ''),
(13, 'cbbe5c1ddfb264a6e5d509ce1c78c95f', 2, 'Index Value', 'index_value', 'in', '', 0, 'index_value', '', ''),
(14, 'e6deda7be0f391399c5130e7c4a48b28', 2, 'Output Type ID', 'output_type', 'in', '', 0, 'output_type', '', ''),
(15, 'edfd72783ad02df128ff82fc9324b4b9', 3, 'Disk Partition', 'partition', 'in', '', 1, '', '', ''),
(16, '8b75fb61d288f0b5fc0bd3056af3689b', 3, 'Kilobytes Free', 'kilobytes', 'out', 'on', 0, '', '', ''),
(17, '363588d49b263d30aecb683c52774f39', 4, '1 Minute Average', '1min', 'out', 'on', 0, '', '', ''),
(18, 'ad139a9e1d69881da36fca07889abf58', 4, '5 Minute Average', '5min', 'out', 'on', 0, '', '', ''),
(19, '5db9fee64824c08258c7ff6f8bc53337', 4, '10 Minute Average', '10min', 'out', 'on', 0, '', '', ''),
(20, 'c0cfd0beae5e79927c5a360076706820', 5, 'Username (Optional)', 'username', 'in', '', 1, '', '', 'on'),
(21, '52c58ad414d9a2a83b00a7a51be75a53', 5, 'Logged In Users', 'users', 'out', 'on', 0, '', '', ''),
(22, '05eb5d710f0814871b8515845521f8d7', 6, 'Grep String', 'grepstr', 'in', '', 1, '', '', ''),
(23, '86cb1cbfde66279dbc7f1144f43a3219', 6, 'Result (in Kilobytes)', 'kilobytes', 'out', 'on', 0, '', '', ''),
(24, 'd5a8dd5fbe6a5af11667c0039af41386', 7, 'Number of Processes', 'proc', 'out', 'on', 0, '', '', ''),
(25, '8848cdcae831595951a3f6af04eec93b', 8, 'Grep String', 'grepstr', 'in', '', 1, '', '', 'on'),
(26, '3d1288d33008430ce354e8b9c162f7ff', 8, 'Connections', 'connections', 'out', 'on', 0, '', '', ''),
(27, 'c6af570bb2ed9c84abf32033702e2860', 9, '(Optional) Log Path', 'log_path', 'in', '', 1, '', '', 'on'),
(28, 'f9389860f5c5340c9b27fca0b4ee5e71', 9, 'Web Hits', 'webhits', 'out', 'on', 0, '', '', ''),
(29, '5fbadb91ad66f203463c1187fe7bd9d5', 10, 'IP Address', 'ip', 'in', '', 1, 'hostname', '', ''),
(30, '6ac4330d123c69067d36a933d105e89a', 10, 'Milliseconds', 'out_ms', 'out', 'on', 0, '', '', ''),
(31, 'd39556ecad6166701bfb0e28c5a11108', 11, 'Index Type', 'index_type', 'in', '', 0, 'index_type', '', ''),
(32, '3b7caa46eb809fc238de6ef18b6e10d5', 11, 'Index Value', 'index_value', 'in', '', 0, 'index_value', '', ''),
(33, '74af2e42dc12956c4817c2ef5d9983f9', 11, 'Output Type ID', 'output_type', 'in', '', 0, 'output_type', '', ''),
(34, '8ae57f09f787656bf4ac541e8bd12537', 11, 'Output Value', 'output', 'out', 'on', 0, '', '', ''),
(35, '172b4b0eacee4948c6479f587b62e512', 12, 'Index Type', 'index_type', 'in', '', 0, 'index_type', '', ''),
(36, '30fb5d5bcf3d66bb5abe88596f357c26', 12, 'Index Value', 'index_value', 'in', '', 0, 'index_value', '', ''),
(37, '31112c85ae4ff821d3b288336288818c', 12, 'Output Type ID', 'output_type', 'in', '', 0, 'output_type', '', ''),
(38, '5be8fa85472d89c621790b43510b5043', 12, 'Output Value', 'output', 'out', 'on', 0, '', '', ''),
(39, 'c1f36ee60c3dc98945556d57f26e475b', 2, 'SNMP Port', 'snmp_port', 'in', '', 0, 'snmp_port', '', ''),
(40, 'fc64b99742ec417cc424dbf8c7692d36', 1, 'SNMP Port', 'snmp_port', 'in', '', 0, 'snmp_port', '', ''),
(41, '20832ce12f099c8e54140793a091af90', 1, 'SNMP Authenticaion Protocol (v3)', 'snmp_auth_protocol', 'in', '', 0, 'snmp_auth_protocol', '', ''),
(42, 'c60c9aac1e1b3555ea0620b8bbfd82cb', 1, 'SNMP Privacy Passphrase (v3)', 'snmp_priv_passphrase', 'in', '', 0, 'snmp_priv_passphrase', '', ''),
(43, 'feda162701240101bc74148415ef415a', 1, 'SNMP Privacy Protocol (v3)', 'snmp_priv_protocol', 'in', '', 0, 'snmp_priv_protocol', '', ''),
(44, '2cf7129ad3ff819a7a7ac189bee48ce8', 2, 'SNMP Authenticaion Protocol (v3)', 'snmp_auth_protocol', 'in', '', 0, 'snmp_auth_protocol', '', ''),
(45, '6b13ac0a0194e171d241d4b06f913158', 2, 'SNMP Privacy Passphrase (v3)', 'snmp_priv_passphrase', 'in', '', 0, 'snmp_priv_passphrase', '', ''),
(46, '3a33d4fc65b8329ab2ac46a36da26b72', 2, 'SNMP Privacy Protocol (v3)', 'snmp_priv_protocol', 'in', '', 0, 'snmp_priv_protocol', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `data_local`
--

CREATE TABLE `data_local` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `data_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `host_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `snmp_query_id` mediumint(8) NOT NULL DEFAULT '0',
  `snmp_index` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_local`
--

INSERT INTO `data_local` (`id`, `data_template_id`, `host_id`, `snmp_query_id`, `snmp_index`) VALUES
(1, 1, 1, 0, ''),
(2, 2, 1, 0, ''),
(3, 3, 1, 0, ''),
(4, 4, 1, 0, ''),
(5, 5, 1, 0, ''),
(6, 4, 2, 0, ''),
(7, 5, 2, 0, ''),
(8, 2, 2, 0, ''),
(9, 3, 2, 0, ''),
(10, 1, 2, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `data_source_profiles`
--

CREATE TABLE `data_source_profiles` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `step` int(10) UNSIGNED NOT NULL DEFAULT '300',
  `heartbeat` int(10) UNSIGNED NOT NULL DEFAULT '600',
  `x_files_factor` double DEFAULT '0.5',
  `default` char(2) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores Data Source Profiles';

--
-- Dumping data for table `data_source_profiles`
--

INSERT INTO `data_source_profiles` (`id`, `hash`, `name`, `step`, `heartbeat`, `x_files_factor`, `default`) VALUES
(1, 'd62c52891f4f9688729a5bc9fad91b18', 'System Default', 300, 600, 0.5, 'on'),
(2, 'c0dd0e46b9ca268e7ed4162d329f9215', 'High Collection Rate', 30, 1200, 0.5, '');

-- --------------------------------------------------------

--
-- Table structure for table `data_source_profiles_cf`
--

CREATE TABLE `data_source_profiles_cf` (
  `data_source_profile_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `consolidation_function_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maps the Data Source Profile Consolidation Functions';

--
-- Dumping data for table `data_source_profiles_cf`
--

INSERT INTO `data_source_profiles_cf` (`data_source_profile_id`, `consolidation_function_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `data_source_profiles_rra`
--

CREATE TABLE `data_source_profiles_rra` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `data_source_profile_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `steps` int(10) UNSIGNED DEFAULT '1',
  `rows` int(10) UNSIGNED NOT NULL DEFAULT '700',
  `timespan` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores RRA Definitions for Data Source Profiles';

--
-- Dumping data for table `data_source_profiles_rra`
--

INSERT INTO `data_source_profiles_rra` (`id`, `data_source_profile_id`, `name`, `steps`, `rows`, `timespan`) VALUES
(1, 1, 'Daily (5 Minute Average)', 1, 600, 86400),
(2, 1, 'Weekly (30 Minute Average)', 6, 700, 604800),
(3, 1, 'Monthly (2 Hour Average)', 24, 775, 2618784),
(4, 1, 'Yearly (1 Day Average)', 288, 797, 31536000),
(5, 2, '30 Second Samples', 1, 1500, 86400),
(6, 2, '15 Minute Average', 30, 1346, 604800),
(7, 2, '1 Hour Average', 120, 1445, 2618784),
(8, 2, '4 Hour Average', 480, 4380, 31536000);

-- --------------------------------------------------------

--
-- Table structure for table `data_source_purge_action`
--

CREATE TABLE `data_source_purge_action` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `local_data_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `action` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='RRD Cleaner File Actions';

-- --------------------------------------------------------

--
-- Table structure for table `data_source_purge_temp`
--

CREATE TABLE `data_source_purge_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_cache` varchar(255) NOT NULL DEFAULT '',
  `local_data_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_mod` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `in_cacti` tinyint(4) NOT NULL DEFAULT '0',
  `data_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='RRD Cleaner File Repository';

-- --------------------------------------------------------

--
-- Table structure for table `data_source_stats_daily`
--

CREATE TABLE `data_source_stats_daily` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_source_stats_hourly`
--

CREATE TABLE `data_source_stats_hourly` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_source_stats_hourly_cache`
--

CREATE TABLE `data_source_stats_hourly_cache` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` double DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_source_stats_hourly_last`
--

CREATE TABLE `data_source_stats_hourly_last` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `value` double DEFAULT NULL,
  `calculated` double DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_source_stats_monthly`
--

CREATE TABLE `data_source_stats_monthly` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_source_stats_weekly`
--

CREATE TABLE `data_source_stats_weekly` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_source_stats_yearly`
--

CREATE TABLE `data_source_stats_yearly` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_template`
--

CREATE TABLE `data_template` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_template`
--

INSERT INTO `data_template` (`id`, `hash`, `name`) VALUES
(1, '9b8c92d3c32703900ff7dd653bfc9cd8', 'Unix - Processes'),
(2, '9e72511e127de200733eb502eb818e1d', 'Unix - Load Average'),
(3, 'c221c2164c585b6da378013a7a6a2c13', 'Unix - Logged in Users'),
(4, 'dc33aa9a8e71fb7c61ec0e7a6da074aa', 'Linux - Memory - Free'),
(5, '41f55087d067142d702dd3c73c98f020', 'Linux - Memory - Free Swap'),
(6, 'e4ac6919d4f6f21ec5b281a1d6ac4d4e', 'Unix - Hard Drive Space');

-- --------------------------------------------------------

--
-- Table structure for table `data_template_data`
--

CREATE TABLE `data_template_data` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `local_data_template_data_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `local_data_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `data_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `data_input_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `t_name` char(2) DEFAULT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `name_cache` varchar(255) NOT NULL DEFAULT '',
  `data_source_path` varchar(255) DEFAULT '',
  `t_active` char(2) DEFAULT '',
  `active` char(2) DEFAULT NULL,
  `t_rrd_step` char(2) DEFAULT '',
  `rrd_step` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `t_data_source_profile_id` char(2) DEFAULT '',
  `data_source_profile_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_template_data`
--

INSERT INTO `data_template_data` (`id`, `local_data_template_data_id`, `local_data_id`, `data_template_id`, `data_input_id`, `t_name`, `name`, `name_cache`, `data_source_path`, `t_active`, `active`, `t_rrd_step`, `rrd_step`, `t_data_source_profile_id`, `data_source_profile_id`) VALUES
(1, 0, 0, 1, 7, '', '|host_description| - Processes', '', '', '', 'on', '', 300, 'on', 1),
(2, 0, 0, 2, 4, '', '|host_description| - Load Average', '', '', '', 'on', '', 300, '', 1),
(3, 0, 0, 3, 5, '', '|host_description| - Logged in Users', '', '', '', 'on', '', 300, '', 1),
(4, 0, 0, 4, 6, '', '|host_description| - Memory - Free', '', '', '', 'on', '', 300, '', 1),
(5, 0, 0, 5, 6, '', '|host_description| - Memory - Free Swap', '', '', '', 'on', '', 300, '', 1),
(6, 0, 0, 6, 11, 'on', '|host_description| - Hard Drive Space', '', '', '', 'on', '', 300, '', 1),
(7, 1, 1, 1, 7, NULL, '|host_description| - Processes', 'Local Linux Machine - Processes', '<path_rra>/local_linux_machine_proc_1.rrd', '', 'on', '', 300, '', 1),
(8, 2, 2, 2, 4, NULL, '|host_description| - Load Average', 'Local Linux Machine - Load Average', '<path_rra>/local_linux_machine_load_1min_2.rrd', '', 'on', '', 300, '', 1),
(9, 3, 3, 3, 5, NULL, '|host_description| - Logged in Users', 'Local Linux Machine - Logged in Users', '<path_rra>/local_linux_machine_users_3.rrd', '', 'on', '', 300, '', 1),
(10, 4, 4, 4, 6, NULL, '|host_description| - Memory - Free', 'Local Linux Machine - Memory - Free', '<path_rra>/local_linux_machine_mem_buffers_4.rrd', '', 'on', '', 300, '', 1),
(11, 5, 5, 5, 6, NULL, '|host_description| - Memory - Free Swap', 'Local Linux Machine - Memory - Free Swap', '<path_rra>/local_linux_machine_mem_swap_5.rrd', '', 'on', '', 300, '', 1),
(12, 4, 6, 4, 6, NULL, '|host_description| - Memory - Free', 'Ubuntu Minion - Memory - Free', '<path_rra>/ubuntu_minion_mem_buffers_6.rrd', '', 'on', '', 300, '', 1),
(13, 5, 7, 5, 6, NULL, '|host_description| - Memory - Free Swap', 'Ubuntu Minion - Memory - Free Swap', '<path_rra>/ubuntu_minion_mem_swap_7.rrd', '', 'on', '', 300, '', 1),
(14, 2, 8, 2, 4, NULL, '|host_description| - Load Average', 'Ubuntu Minion - Load Average', '<path_rra>/ubuntu_minion_load_1min_8.rrd', '', 'on', '', 300, '', 1),
(15, 3, 9, 3, 5, NULL, '|host_description| - Logged in Users', 'Ubuntu Minion - Logged in Users', '<path_rra>/ubuntu_minion_users_9.rrd', '', 'on', '', 300, '', 1),
(16, 1, 10, 1, 7, NULL, '|host_description| - Processes', 'Ubuntu Minion - Processes', '<path_rra>/ubuntu_minion_proc_10.rrd', '', 'on', '', 300, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_template_rrd`
--

CREATE TABLE `data_template_rrd` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `local_data_template_rrd_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `local_data_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `data_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `t_rrd_maximum` char(2) DEFAULT NULL,
  `rrd_maximum` varchar(20) NOT NULL DEFAULT '0',
  `t_rrd_minimum` char(2) DEFAULT NULL,
  `rrd_minimum` varchar(20) NOT NULL DEFAULT '0',
  `t_rrd_heartbeat` char(2) DEFAULT NULL,
  `rrd_heartbeat` mediumint(6) NOT NULL DEFAULT '0',
  `t_data_source_type_id` char(2) DEFAULT NULL,
  `data_source_type_id` smallint(5) NOT NULL DEFAULT '0',
  `t_data_source_name` char(2) DEFAULT NULL,
  `data_source_name` varchar(19) NOT NULL DEFAULT '',
  `t_data_input_field_id` char(2) DEFAULT NULL,
  `data_input_field_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_template_rrd`
--

INSERT INTO `data_template_rrd` (`id`, `hash`, `local_data_template_rrd_id`, `local_data_id`, `data_template_id`, `t_rrd_maximum`, `rrd_maximum`, `t_rrd_minimum`, `rrd_minimum`, `t_rrd_heartbeat`, `rrd_heartbeat`, `t_data_source_type_id`, `data_source_type_id`, `t_data_source_name`, `data_source_name`, `t_data_input_field_id`, `data_input_field_id`) VALUES
(1, 'f1ba3a5b17b95825021241398bb0f277', 0, 0, 1, '', '1000', '', '0', '', 600, '', 1, '', 'proc', '', 24),
(2, '8175ca431c8fe50efff5a1d3ae51b55d', 0, 0, 2, '', '500', '', '0', '', 600, '', 1, '', 'load_1min', '', 17),
(3, '9f951b7fb3b19285a411aebb5254a831', 0, 0, 2, '', '500', '', '0', '', 600, '', 1, '', 'load_15min', '', 19),
(4, 'a2eeb8acd6ea01cd0e3ac852965c0eb6', 0, 0, 2, '', '500', '', '0', '', 600, '', 1, '', 'load_5min', '', 18),
(5, '46a5afe8e6c0419172c76421dc9e304a', 0, 0, 3, '', '500', '', '0', '', 600, '', 1, '', 'users', '', 21),
(6, 'a4df3de5238d3beabee1a2fe140d3d80', 0, 0, 4, '', '0', '', '0', '', 600, '', 1, '', 'mem_buffers', '', 23),
(7, '7fea6acc9b1a19484b4cb4cef2b6c5da', 0, 0, 5, '', '0', '', '0', '', 600, '', 1, '', 'mem_swap', '', 23),
(8, '07175541991def89bd02d28a215f6fcc', 0, 0, 6, '', '0', '', '0', '', 600, '', 1, '', 'hdd_used', '', 0),
(9, '4c82df790325d789d304e6ee5cd4ab7d', 0, 0, 6, '', '0', '', '0', '', 600, '', 1, '', 'hdd_free', '', 0),
(10, '', 1, 1, 1, NULL, '1000', NULL, '0', NULL, 600, NULL, 1, NULL, 'proc', NULL, 24),
(11, '', 2, 2, 2, NULL, '500', NULL, '0', NULL, 600, NULL, 1, NULL, 'load_1min', NULL, 17),
(12, '', 3, 2, 2, NULL, '500', NULL, '0', NULL, 600, NULL, 1, NULL, 'load_15min', NULL, 19),
(13, '', 4, 2, 2, NULL, '500', NULL, '0', NULL, 600, NULL, 1, NULL, 'load_5min', NULL, 18),
(14, '', 5, 3, 3, NULL, '500', NULL, '0', NULL, 600, NULL, 1, NULL, 'users', NULL, 21),
(15, '', 6, 4, 4, NULL, '0', NULL, '0', NULL, 600, NULL, 1, NULL, 'mem_buffers', NULL, 23),
(16, '', 7, 5, 5, NULL, '0', NULL, '0', NULL, 600, NULL, 1, NULL, 'mem_swap', NULL, 23),
(17, '', 6, 6, 4, NULL, '0', NULL, '0', NULL, 600, NULL, 1, NULL, 'mem_buffers', NULL, 23),
(18, '', 7, 7, 5, NULL, '0', NULL, '0', NULL, 600, NULL, 1, NULL, 'mem_swap', NULL, 23),
(19, '', 2, 8, 2, NULL, '500', NULL, '0', NULL, 600, NULL, 1, NULL, 'load_1min', NULL, 17),
(20, '', 3, 8, 2, NULL, '500', NULL, '0', NULL, 600, NULL, 1, NULL, 'load_15min', NULL, 19),
(21, '', 4, 8, 2, NULL, '500', NULL, '0', NULL, 600, NULL, 1, NULL, 'load_5min', NULL, 18),
(22, '', 5, 9, 3, NULL, '500', NULL, '0', NULL, 600, NULL, 1, NULL, 'users', NULL, 21),
(23, '', 1, 10, 1, NULL, '1000', NULL, '0', NULL, 600, NULL, 1, NULL, 'proc', NULL, 24);

-- --------------------------------------------------------

--
-- Table structure for table `external_links`
--

CREATE TABLE `external_links` (
  `id` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `enabled` char(2) DEFAULT 'on',
  `contentfile` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(20) NOT NULL DEFAULT '',
  `style` varchar(10) NOT NULL DEFAULT '',
  `extendedstyle` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains external links that are embedded into Cacti';

-- --------------------------------------------------------

--
-- Table structure for table `graph_local`
--

CREATE TABLE `graph_local` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `graph_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `host_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `snmp_query_id` mediumint(8) NOT NULL DEFAULT '0',
  `snmp_query_graph_id` mediumint(8) NOT NULL DEFAULT '0',
  `snmp_index` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Creates a relationship for each item in a custom graph.';

--
-- Dumping data for table `graph_local`
--

INSERT INTO `graph_local` (`id`, `graph_template_id`, `host_id`, `snmp_query_id`, `snmp_query_graph_id`, `snmp_index`) VALUES
(1, 1, 1, 0, 0, ''),
(2, 2, 1, 0, 0, ''),
(3, 3, 1, 0, 0, ''),
(4, 4, 1, 0, 0, ''),
(5, 4, 2, 0, 0, ''),
(6, 2, 2, 0, 0, ''),
(7, 3, 2, 0, 0, ''),
(8, 1, 2, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `graph_templates`
--

CREATE TABLE `graph_templates` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` char(32) NOT NULL DEFAULT '',
  `name` char(255) NOT NULL DEFAULT '',
  `multiple` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains each graph template name.';

--
-- Dumping data for table `graph_templates`
--

INSERT INTO `graph_templates` (`id`, `hash`, `name`, `multiple`) VALUES
(1, '9fe8b4da353689d376b99b2ea526cc6b', 'Unix - Processes', ''),
(2, 'fe5edd777a76d48fc48c11aded5211ef', 'Unix - Load Average', ''),
(3, '63610139d44d52b195cc375636653ebd', 'Unix - Logged in Users', ''),
(4, '6992ed4df4b44f3d5595386b8298f0ec', 'Linux - Memory Usage', ''),
(5, '8e7c8a511652fe4a8e65c69f3d34779d', 'Unix - Available Disk Space', '');

-- --------------------------------------------------------

--
-- Table structure for table `graph_templates_gprint`
--

CREATE TABLE `graph_templates_gprint` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `gprint_text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `graph_templates_gprint`
--

INSERT INTO `graph_templates_gprint` (`id`, `hash`, `name`, `gprint_text`) VALUES
(2, 'e9c43831e54eca8069317a2ce8c6f751', 'Normal', '%8.2lf %s'),
(3, '19414480d6897c8731c7dc6c5310653e', 'Exact Numbers', '%8.0lf'),
(4, '304a778405392f878a6db435afffc1e9', 'Load Average', '%4.2lf');

-- --------------------------------------------------------

--
-- Table structure for table `graph_templates_graph`
--

CREATE TABLE `graph_templates_graph` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `local_graph_template_graph_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `local_graph_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `graph_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `t_image_format_id` char(2) DEFAULT '',
  `image_format_id` tinyint(1) NOT NULL DEFAULT '0',
  `t_title` char(2) DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_cache` varchar(255) NOT NULL DEFAULT '',
  `t_height` char(2) DEFAULT '',
  `height` mediumint(8) NOT NULL DEFAULT '0',
  `t_width` char(2) DEFAULT '',
  `width` mediumint(8) NOT NULL DEFAULT '0',
  `t_upper_limit` char(2) DEFAULT '',
  `upper_limit` varchar(20) NOT NULL DEFAULT '0',
  `t_lower_limit` char(2) DEFAULT '',
  `lower_limit` varchar(20) NOT NULL DEFAULT '0',
  `t_vertical_label` char(2) DEFAULT '',
  `vertical_label` varchar(200) DEFAULT NULL,
  `t_slope_mode` char(2) DEFAULT '',
  `slope_mode` char(2) DEFAULT 'on',
  `t_auto_scale` char(2) DEFAULT '',
  `auto_scale` char(2) DEFAULT NULL,
  `t_auto_scale_opts` char(2) DEFAULT '',
  `auto_scale_opts` tinyint(1) NOT NULL DEFAULT '0',
  `t_auto_scale_log` char(2) DEFAULT '',
  `auto_scale_log` char(2) DEFAULT NULL,
  `t_scale_log_units` char(2) DEFAULT '',
  `scale_log_units` char(2) DEFAULT NULL,
  `t_auto_scale_rigid` char(2) DEFAULT '',
  `auto_scale_rigid` char(2) DEFAULT NULL,
  `t_auto_padding` char(2) DEFAULT '',
  `auto_padding` char(2) DEFAULT NULL,
  `t_base_value` char(2) DEFAULT '',
  `base_value` mediumint(8) NOT NULL DEFAULT '0',
  `t_grouping` char(2) DEFAULT '',
  `grouping` char(2) NOT NULL DEFAULT '',
  `t_unit_value` char(2) DEFAULT '',
  `unit_value` varchar(20) DEFAULT NULL,
  `t_unit_exponent_value` char(2) DEFAULT '',
  `unit_exponent_value` varchar(5) NOT NULL DEFAULT '',
  `t_alt_y_grid` char(2) DEFAULT '',
  `alt_y_grid` char(2) DEFAULT NULL,
  `t_right_axis` char(2) DEFAULT '',
  `right_axis` varchar(20) DEFAULT NULL,
  `t_right_axis_label` char(2) DEFAULT '',
  `right_axis_label` varchar(200) DEFAULT NULL,
  `t_right_axis_format` char(2) DEFAULT '',
  `right_axis_format` mediumint(8) DEFAULT NULL,
  `t_right_axis_formatter` char(2) DEFAULT '',
  `right_axis_formatter` varchar(10) DEFAULT NULL,
  `t_left_axis_formatter` char(2) DEFAULT '',
  `left_axis_formatter` varchar(10) DEFAULT NULL,
  `t_no_gridfit` char(2) DEFAULT '',
  `no_gridfit` char(2) DEFAULT NULL,
  `t_unit_length` char(2) DEFAULT '',
  `unit_length` varchar(10) DEFAULT NULL,
  `t_tab_width` char(2) DEFAULT '',
  `tab_width` varchar(20) DEFAULT '30',
  `t_dynamic_labels` char(2) DEFAULT '',
  `dynamic_labels` char(2) DEFAULT NULL,
  `t_force_rules_legend` char(2) DEFAULT '',
  `force_rules_legend` char(2) DEFAULT NULL,
  `t_legend_position` char(2) DEFAULT '',
  `legend_position` varchar(10) DEFAULT NULL,
  `t_legend_direction` char(2) DEFAULT '',
  `legend_direction` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the actual graph data.';

--
-- Dumping data for table `graph_templates_graph`
--

INSERT INTO `graph_templates_graph` (`id`, `local_graph_template_graph_id`, `local_graph_id`, `graph_template_id`, `t_image_format_id`, `image_format_id`, `t_title`, `title`, `title_cache`, `t_height`, `height`, `t_width`, `width`, `t_upper_limit`, `upper_limit`, `t_lower_limit`, `lower_limit`, `t_vertical_label`, `vertical_label`, `t_slope_mode`, `slope_mode`, `t_auto_scale`, `auto_scale`, `t_auto_scale_opts`, `auto_scale_opts`, `t_auto_scale_log`, `auto_scale_log`, `t_scale_log_units`, `scale_log_units`, `t_auto_scale_rigid`, `auto_scale_rigid`, `t_auto_padding`, `auto_padding`, `t_base_value`, `base_value`, `t_grouping`, `grouping`, `t_unit_value`, `unit_value`, `t_unit_exponent_value`, `unit_exponent_value`, `t_alt_y_grid`, `alt_y_grid`, `t_right_axis`, `right_axis`, `t_right_axis_label`, `right_axis_label`, `t_right_axis_format`, `right_axis_format`, `t_right_axis_formatter`, `right_axis_formatter`, `t_left_axis_formatter`, `left_axis_formatter`, `t_no_gridfit`, `no_gridfit`, `t_unit_length`, `unit_length`, `t_tab_width`, `tab_width`, `t_dynamic_labels`, `dynamic_labels`, `t_force_rules_legend`, `force_rules_legend`, `t_legend_position`, `legend_position`, `t_legend_direction`, `legend_direction`) VALUES
(1, 0, 0, 1, '', 1, '', '|host_description| - Processes', '', '', 150, '', 600, '', '100', '', '0', '', 'processes', '', 'on', '', 'on', '', 2, '', '', '', '', '', '', '', 'on', '', 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '40', '', '', '', '', '', '', '', ''),
(2, 0, 0, 2, '', 1, '', '|host_description| - Load Average', '', '', 150, '', 600, '', '100', '', '0', '', 'run que length', '', 'on', '', 'on', '', 2, '', '', '', '', '', 'on', '', 'on', '', 1000, '', '', '', '', '', '0', '', '', '', '', '', '', '', 0, '', '0', '', '0', '', '', '', '', '', '40', '', '', '', '', '', '0', '', '0'),
(3, 0, 0, 3, '', 1, '', '|host_description| - Logged in Users', '', '', 150, '', 600, '', '100', '', '0', '', 'users', '', 'on', '', 'on', '', 2, '', '', '', '', '', 'on', '', 'on', '', 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '40', '', '', '', '', '', '', '', ''),
(4, 0, 0, 4, '', 1, '', '|host_description| - Memory Usage', '', '', 150, '', 600, '', '100', '', '0', '', 'kilobytes', '', 'on', '', 'on', '', 2, '', '', '', '', '', 'on', '', 'on', '', 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '40', '', '', '', '', '', '', '', ''),
(5, 0, 0, 5, '', 1, 'on', '|host_description| - Available Disk Space', '', '', 150, '', 600, '', '100', '', '0', '', 'bytes', '', 'on', '', 'on', '', 2, '', '', '', '', '', 'on', '', 'on', '', 1024, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '40', '', '', '', '', '', '', '', ''),
(6, 1, 1, 1, '', 1, '', '|host_description| - Processes', 'Local Linux Machine - Processes', '', 150, '', 600, '', '100', '', '0', '', 'processes', '', 'on', '', 'on', '', 2, '', '', '', '', '', '', '', 'on', '', 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '40', '', '', '', '', '', '', '', ''),
(7, 2, 2, 2, '', 1, '', '|host_description| - Load Average', 'Local Linux Machine - Load Average', '', 150, '', 600, '', '100', '', '0', '', 'run que length', '', 'on', '', 'on', '', 2, '', '', '', '', '', 'on', '', 'on', '', 1000, '', '', '', '', '', '0', '', '', '', '', '', '', '', 0, '', '0', '', '0', '', '', '', '', '', '40', '', '', '', '', '', '0', '', '0'),
(8, 3, 3, 3, '', 1, '', '|host_description| - Logged in Users', 'Local Linux Machine - Logged in Users', '', 150, '', 600, '', '100', '', '0', '', 'users', '', 'on', '', 'on', '', 2, '', '', '', '', '', 'on', '', 'on', '', 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '40', '', '', '', '', '', '', '', ''),
(9, 4, 4, 4, '', 1, '', '|host_description| - Memory Usage', 'Local Linux Machine - Memory Usage', '', 150, '', 600, '', '100', '', '0', '', 'kilobytes', '', 'on', '', 'on', '', 2, '', '', '', '', '', 'on', '', 'on', '', 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '40', '', '', '', '', '', '', '', ''),
(10, 4, 5, 4, '', 1, '', '|host_description| - Memory Usage', 'Ubuntu Minion - Memory Usage', '', 150, '', 600, '', '100', '', '0', '', 'kilobytes', '', 'on', '', 'on', '', 2, '', '', '', '', '', 'on', '', 'on', '', 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '40', '', '', '', '', '', '', '', ''),
(11, 2, 6, 2, '', 1, '', '|host_description| - Load Average', 'Ubuntu Minion - Load Average', '', 150, '', 600, '', '100', '', '0', '', 'run que length', '', 'on', '', 'on', '', 2, '', '', '', '', '', 'on', '', 'on', '', 1000, '', '', '', '', '', '0', '', '', '', '', '', '', '', 0, '', '0', '', '0', '', '', '', '', '', '40', '', '', '', '', '', '0', '', '0'),
(12, 3, 7, 3, '', 1, '', '|host_description| - Logged in Users', 'Ubuntu Minion - Logged in Users', '', 150, '', 600, '', '100', '', '0', '', 'users', '', 'on', '', 'on', '', 2, '', '', '', '', '', 'on', '', 'on', '', 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '40', '', '', '', '', '', '', '', ''),
(13, 1, 8, 1, '', 1, '', '|host_description| - Processes', 'Ubuntu Minion - Processes', '', 150, '', 600, '', '100', '', '0', '', 'processes', '', 'on', '', 'on', '', 2, '', '', '', '', '', '', '', 'on', '', 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '40', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `graph_templates_item`
--

CREATE TABLE `graph_templates_item` (
  `id` int(12) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `local_graph_template_item_id` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `local_graph_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `graph_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `task_item_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `color_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `alpha` char(2) DEFAULT 'FF',
  `graph_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `line_width` decimal(4,2) DEFAULT '0.00',
  `dashes` varchar(20) DEFAULT NULL,
  `dash_offset` mediumint(4) DEFAULT NULL,
  `cdef_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `vdef_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `shift` char(2) DEFAULT NULL,
  `consolidation_function_id` tinyint(2) NOT NULL DEFAULT '0',
  `textalign` varchar(10) DEFAULT NULL,
  `text_format` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `hard_return` char(2) DEFAULT NULL,
  `gprint_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the actual graph item data.';

--
-- Dumping data for table `graph_templates_item`
--

INSERT INTO `graph_templates_item` (`id`, `hash`, `local_graph_template_item_id`, `local_graph_id`, `graph_template_id`, `task_item_id`, `color_id`, `alpha`, `graph_type_id`, `line_width`, `dashes`, `dash_offset`, `cdef_id`, `vdef_id`, `shift`, `consolidation_function_id`, `textalign`, `text_format`, `value`, `hard_return`, `gprint_id`, `sequence`) VALUES
(1, 'ba00ecd28b9774348322ff70a96f2826', 0, 0, 1, 1, 48, '7F', 7, '0.00', '', 0, 0, 0, '', 1, '', 'Running Processes', '', '', 2, 1),
(2, '304244ca63d5b09e62a94c8ec6fbda8d', 0, 0, 1, 1, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 3, 3),
(3, 'da1ba71a93d2ed4a2a00d54592b14157', 0, 0, 1, 1, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 3, 4),
(4, '5b4f05b04f704a24c663998293fa8848', 0, 0, 1, 1, 48, 'FF', 4, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 5),
(5, '93ad2f2803b5edace85d86896620b9da', 0, 0, 2, 2, 15, '7F', 7, '0.00', '', 0, 0, 0, '', 1, '', '1 Minute Average', '', '', 2, 1),
(6, 'fa1570f2b111da3555e165c7873a376b', 0, 0, 2, 2, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 4, 2),
(7, '16675723e5e9885489c2ccbbcee82ef0', 0, 0, 2, 2, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 4, 3),
(8, '31aab74f1dc7d1bf540da8cc19203944', 0, 0, 2, 2, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 4, 4),
(9, 'bbdfa13adc00398eed132b1ccb4337d2', 0, 0, 2, 4, 8, '7F', 8, '0.00', '', 0, 0, 0, '', 1, '', '5 Minute Average', '', '', 2, 5),
(10, '0f5158874901e0ecfba9b4dc9a4f3afd', 0, 0, 2, 4, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 4, 6),
(11, 'e8425ef97ba1b5d98a84bda5ea42c0e8', 0, 0, 2, 4, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 4, 7),
(12, '760f184ddf2c4f10d26f1b1eec68f579', 0, 0, 2, 4, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 4, 8),
(13, '9cf6ed48a6a54b9644a1de8c9929bd4e', 0, 0, 2, 3, 9, '7F', 8, '0.00', '', 0, 0, 0, '', 1, '', '15 Minute Average', '', '', 2, 9),
(14, '0dd3ea1600ef0749b7895f349de650a0', 0, 0, 2, 3, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 4, 10),
(15, '15ac9644211ac78240154a0eb3cd8b29', 0, 0, 2, 3, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 4, 11),
(16, 'c45aeff75d805220a7798f46324381f6', 0, 0, 2, 3, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 4, 12),
(17, 'fa1bc4eff128c4da70f5247d55b8a444', 0, 0, 2, 0, 1, 'FF', 4, '0.00', '', 0, 12, 0, '', 1, '', '', '', 'on', 2, 13),
(18, 'cf0848f7482b56ea746453f90881d05e', 0, 0, 2, 2, 15, 'FF', 4, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 14),
(19, 'ebb3b6d41faaf7338fd640b8ff720cb3', 0, 0, 2, 4, 8, 'FF', 20, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 15),
(20, 'f995fe7d096e2ef4b33608328ebc0843', 0, 0, 2, 3, 9, 'FF', 20, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 16),
(21, '5c94ac24bc0d6d2712cc028fa7d4c7d2', 0, 0, 3, 5, 67, '7F', 7, '0.00', '', 0, 0, 0, '', 1, '', 'Users', '', '', 2, 1),
(22, '8bc7f905526f62df7d5c2d8c27c143c1', 0, 0, 3, 5, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 3, 2),
(23, 'cd074cd2b920aab70d480c020276d45b', 0, 0, 3, 5, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 3, 3),
(24, '415630f25f5384ba0c82adbdb05fe98b', 0, 0, 3, 5, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 3, 4),
(25, 'c55914240f7e1d4f881ea598d4de9196', 0, 0, 3, 5, 67, 'FF', 4, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 5),
(26, '5fa7c2317f19440b757ab2ea1cae6abc', 0, 0, 4, 6, 41, 'FF', 7, '0.00', '', 0, 14, 0, '', 1, '', 'Free', '', '', 2, 9),
(27, 'b1d18060bfd3f68e812c508ff4ac94ed', 0, 0, 4, 6, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 4, '', 'Current:', '', '', 2, 10),
(28, '780b6f0850aaf9431d1c246c55143061', 0, 0, 4, 6, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 1, '', 'Average:', '', '', 2, 11),
(29, '2d54a7e7bb45e6c52d97a09e24b7fba7', 0, 0, 4, 6, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 3, '', 'Maximum:', '', 'on', 2, 12),
(30, '40206367a3c192b836539f49801a0b15', 0, 0, 4, 7, 30, 'FF', 8, '0.00', '', 0, 14, 0, '', 1, '', 'Swap', '', '', 2, 13),
(31, '7ee72e2bb3722d4f8a7f9c564e0dd0d0', 0, 0, 4, 7, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 4, '', 'Current:', '', '', 2, 14),
(32, 'c8af33b949e8f47133ee25e63c91d4d0', 0, 0, 4, 7, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 1, '', 'Average:', '', '', 2, 15),
(33, '568128a16723d1195ce6a234d353ce00', 0, 0, 4, 7, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 3, '', 'Maximum:', '', 'on', 2, 16),
(34, '6ca2161c37b0118786dbdb46ad767e5d', 0, 0, 5, 8, 48, '7F', 7, '0.00', '', 0, 14, 0, '', 1, '', 'Used', '', '', 2, 1),
(35, '8ef3e7fb7ce962183f489725939ea40f', 0, 0, 5, 8, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 4, '', 'Current:', '', '', 2, 2),
(36, '3b13eb2e542fe006c9bf86947a6854fa', 0, 0, 5, 8, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 1, '', 'Average:', '', '', 2, 3),
(37, 'a751838f87068e073b95be9555c57bde', 0, 0, 5, 8, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 3, '', 'Maximum:', '', 'on', 2, 4),
(38, '5d6dff9c14c71dc1ebf83e87f1c25695', 0, 0, 5, 9, 20, '7F', 8, '0.00', '', 0, 14, 0, '', 1, '', 'Available', '', '', 2, 5),
(39, 'b27cb9a158187d29d17abddc6fdf0f15', 0, 0, 5, 9, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 4, '', 'Current:', '', '', 2, 6),
(40, '6c0555013bb9b964e51d22f108dae9b0', 0, 0, 5, 9, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 1, '', 'Average:', '', '', 2, 7),
(41, '42ce58ec17ef5199145fbf9c6ee39869', 0, 0, 5, 9, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 3, '', 'Maximum:', '', 'on', 2, 8),
(42, '9bdff98f2394f666deea028cbca685f3', 0, 0, 5, 0, 1, 'FF', 5, '0.00', '', 0, 15, 0, '', 1, '', 'Total', '', '', 2, 9),
(43, 'fb831fefcf602bc31d9d24e8e456c2e6', 0, 0, 5, 0, 0, 'FF', 9, '0.00', '', 0, 15, 0, '', 4, '', 'Current:', '', '', 2, 10),
(44, '5a958d56785a606c08200ef8dbf8deef', 0, 0, 5, 0, 0, 'FF', 9, '0.00', '', 0, 15, 0, '', 1, '', 'Average:', '', '', 2, 11),
(45, '5ce67a658cec37f526dc84ac9e08d6e7', 0, 0, 5, 0, 0, 'FF', 9, '0.00', '', 0, 15, 0, '', 3, '', 'Maximum:', '', 'on', 2, 12),
(46, 'ac0ffc9f0f2cb7f8c6cb9eb8fa73b390', 0, 0, 5, 8, 48, 'FF', 4, '1.00', '', 0, 0, 0, '', 1, '', '', '', '', 2, 13),
(47, 'd9fc8b516374885c6c45153803e5b90a', 0, 0, 5, 8, 20, 'FF', 20, '1.00', '', 0, 0, 0, '', 1, '', '', '', '', 2, 14),
(48, '', 1, 1, 1, 10, 48, '7F', 7, '0.00', '', 0, 0, 0, '', 1, '', 'Running Processes', '', '', 2, 1),
(49, '', 2, 1, 1, 10, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 3, 3),
(50, '', 3, 1, 1, 10, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 3, 4),
(51, '', 4, 1, 1, 10, 48, 'FF', 4, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 5),
(52, '', 5, 2, 2, 11, 15, '7F', 7, '0.00', '', 0, 0, 0, '', 1, '', '1 Minute Average', '', '', 2, 1),
(53, '', 6, 2, 2, 11, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 4, 2),
(54, '', 7, 2, 2, 11, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 4, 3),
(55, '', 8, 2, 2, 11, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 4, 4),
(56, '', 9, 2, 2, 13, 8, '7F', 8, '0.00', '', 0, 0, 0, '', 1, '', '5 Minute Average', '', '', 2, 5),
(57, '', 10, 2, 2, 13, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 4, 6),
(58, '', 11, 2, 2, 13, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 4, 7),
(59, '', 12, 2, 2, 13, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 4, 8),
(60, '', 13, 2, 2, 12, 9, '7F', 8, '0.00', '', 0, 0, 0, '', 1, '', '15 Minute Average', '', '', 2, 9),
(61, '', 14, 2, 2, 12, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 4, 10),
(62, '', 15, 2, 2, 12, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 4, 11),
(63, '', 16, 2, 2, 12, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 4, 12),
(64, '', 17, 2, 2, 0, 1, 'FF', 4, '0.00', '', 0, 12, 0, '', 1, '', '', '', 'on', 2, 13),
(65, '', 18, 2, 2, 11, 15, 'FF', 4, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 14),
(66, '', 19, 2, 2, 13, 8, 'FF', 20, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 15),
(67, '', 20, 2, 2, 12, 9, 'FF', 20, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 16),
(68, '', 21, 3, 3, 14, 67, '7F', 7, '0.00', '', 0, 0, 0, '', 1, '', 'Users', '', '', 2, 1),
(69, '', 22, 3, 3, 14, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 3, 2),
(70, '', 23, 3, 3, 14, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 3, 3),
(71, '', 24, 3, 3, 14, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 3, 4),
(72, '', 25, 3, 3, 14, 67, 'FF', 4, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 5),
(73, '', 26, 4, 4, 15, 41, 'FF', 7, '0.00', '', 0, 14, 0, '', 1, '', 'Free', '', '', 2, 9),
(74, '', 27, 4, 4, 15, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 4, '', 'Current:', '', '', 2, 10),
(75, '', 28, 4, 4, 15, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 1, '', 'Average:', '', '', 2, 11),
(76, '', 29, 4, 4, 15, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 3, '', 'Maximum:', '', 'on', 2, 12),
(77, '', 30, 4, 4, 16, 30, 'FF', 8, '0.00', '', 0, 14, 0, '', 1, '', 'Swap', '', '', 2, 13),
(78, '', 31, 4, 4, 16, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 4, '', 'Current:', '', '', 2, 14),
(79, '', 32, 4, 4, 16, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 1, '', 'Average:', '', '', 2, 15),
(80, '', 33, 4, 4, 16, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 3, '', 'Maximum:', '', 'on', 2, 16),
(81, '', 26, 5, 4, 17, 41, 'FF', 7, '0.00', '', 0, 14, 0, '', 1, '', 'Free', '', '', 2, 9),
(82, '', 27, 5, 4, 17, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 4, '', 'Current:', '', '', 2, 10),
(83, '', 28, 5, 4, 17, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 1, '', 'Average:', '', '', 2, 11),
(84, '', 29, 5, 4, 17, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 3, '', 'Maximum:', '', 'on', 2, 12),
(85, '', 30, 5, 4, 18, 30, 'FF', 8, '0.00', '', 0, 14, 0, '', 1, '', 'Swap', '', '', 2, 13),
(86, '', 31, 5, 4, 18, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 4, '', 'Current:', '', '', 2, 14),
(87, '', 32, 5, 4, 18, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 1, '', 'Average:', '', '', 2, 15),
(88, '', 33, 5, 4, 18, 0, 'FF', 9, '0.00', '', 0, 14, 0, '', 3, '', 'Maximum:', '', 'on', 2, 16),
(89, '', 5, 6, 2, 19, 15, '7F', 7, '0.00', '', 0, 0, 0, '', 1, '', '1 Minute Average', '', '', 2, 1),
(90, '', 6, 6, 2, 19, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 4, 2),
(91, '', 7, 6, 2, 19, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 4, 3),
(92, '', 8, 6, 2, 19, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 4, 4),
(93, '', 9, 6, 2, 21, 8, '7F', 8, '0.00', '', 0, 0, 0, '', 1, '', '5 Minute Average', '', '', 2, 5),
(94, '', 10, 6, 2, 21, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 4, 6),
(95, '', 11, 6, 2, 21, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 4, 7),
(96, '', 12, 6, 2, 21, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 4, 8),
(97, '', 13, 6, 2, 20, 9, '7F', 8, '0.00', '', 0, 0, 0, '', 1, '', '15 Minute Average', '', '', 2, 9),
(98, '', 14, 6, 2, 20, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 4, 10),
(99, '', 15, 6, 2, 20, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 4, 11),
(100, '', 16, 6, 2, 20, 0, 'FF', 9, '1.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 4, 12),
(101, '', 17, 6, 2, 0, 1, 'FF', 4, '0.00', '', 0, 12, 0, '', 1, '', '', '', 'on', 2, 13),
(102, '', 18, 6, 2, 19, 15, 'FF', 4, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 14),
(103, '', 19, 6, 2, 21, 8, 'FF', 20, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 15),
(104, '', 20, 6, 2, 20, 9, 'FF', 20, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 16),
(105, '', 21, 7, 3, 22, 67, '7F', 7, '0.00', '', 0, 0, 0, '', 1, '', 'Users', '', '', 2, 1),
(106, '', 22, 7, 3, 22, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 4, '', 'Current:', '', '', 3, 2),
(107, '', 23, 7, 3, 22, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 3, 3),
(108, '', 24, 7, 3, 22, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 3, 4),
(109, '', 25, 7, 3, 22, 67, 'FF', 4, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 5),
(110, '', 1, 8, 1, 23, 48, '7F', 7, '0.00', '', 0, 0, 0, '', 1, '', 'Running Processes', '', '', 2, 1),
(111, '', 2, 8, 1, 23, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 1, '', 'Average:', '', '', 3, 3),
(112, '', 3, 8, 1, 23, 0, 'FF', 9, '0.00', '', 0, 0, 0, '', 3, '', 'Maximum:', '', 'on', 3, 4),
(113, '', 4, 8, 1, 23, 48, 'FF', 4, '1.00', '', 0, 0, 0, '', 3, '', '', '', '', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `graph_template_input`
--

CREATE TABLE `graph_template_input` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `graph_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `column_name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the names for graph item input groups.';

--
-- Dumping data for table `graph_template_input`
--

INSERT INTO `graph_template_input` (`id`, `hash`, `graph_template_id`, `name`, `description`, `column_name`) VALUES
(1, '1d51dbabb200fcea5c4b157129a75410', 1, 'Legend Color', '', 'color_id'),
(2, '592cedd465877bc61ab549df688b0b2a', 1, 'Processes Data Source', '', 'task_item_id'),
(3, '5dfcaf9fd771deb8c5430bce1562e371', 2, '5 Minute Data Source', '', 'task_item_id'),
(4, '6f3cc610315ee58bc8e0b1f272466324', 2, '15 Minute Data Source', '', 'task_item_id'),
(5, '8cb8ed3378abec21a1819ea52dfee6a3', 2, '1 Minute Data Source', '', 'task_item_id'),
(6, 'b457a982bf46c6760e6ef5f5d06d41fb', 3, 'Logged in Users Data Source', '', 'task_item_id'),
(7, 'bd4a57adf93c884815b25a8036b67f98', 3, 'Legend Color', '', 'color_id'),
(8, '5e62dbea1db699f1bda04c5863e7864d', 4, 'Swap Data Source', '', 'task_item_id'),
(9, '6273c71cdb7ed4ac525cdbcf6180918c', 4, 'Free Data Source', '', 'task_item_id'),
(10, '7b0674dd447a9badf0d11bec688028a8', 5, 'Used Disk Space Data Source', '', 'task_item_id'),
(11, '940beb0f0344e37f4c6cdfc17d2060bc', 5, 'Available Disk Space Data Source', '', 'task_item_id');

-- --------------------------------------------------------

--
-- Table structure for table `graph_template_input_defs`
--

CREATE TABLE `graph_template_input_defs` (
  `graph_template_input_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `graph_template_item_id` int(12) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the relationship for what graph items are associated';

--
-- Dumping data for table `graph_template_input_defs`
--

INSERT INTO `graph_template_input_defs` (`graph_template_input_id`, `graph_template_item_id`) VALUES
(1, 1),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 19),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 20),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 18),
(6, 21),
(6, 22),
(6, 23),
(6, 24),
(6, 25),
(7, 21),
(8, 30),
(8, 31),
(8, 32),
(8, 33),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(10, 34),
(10, 35),
(10, 36),
(10, 37),
(10, 46),
(10, 47),
(11, 38),
(11, 39),
(11, 40),
(11, 41);

-- --------------------------------------------------------

--
-- Table structure for table `graph_tree`
--

CREATE TABLE `graph_tree` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `enabled` char(2) DEFAULT 'on',
  `locked` tinyint(4) DEFAULT '0',
  `locked_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sort_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(10) UNSIGNED DEFAULT '1',
  `user_id` int(10) UNSIGNED DEFAULT '1',
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `graph_tree`
--

INSERT INTO `graph_tree` (`id`, `enabled`, `locked`, `locked_date`, `sort_type`, `name`, `sequence`, `user_id`, `last_modified`, `modified_by`) VALUES
(1, 'on', 0, '0000-00-00 00:00:00', 1, 'Default Tree', 1, 1, '0000-00-00 00:00:00', 1),
(2, 'on', 0, '2018-06-28 07:33:30', 1, 'Servers', 1, 1, '2018-06-28 07:33:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `graph_tree_items`
--

CREATE TABLE `graph_tree_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent` bigint(20) UNSIGNED DEFAULT NULL,
  `position` int(10) UNSIGNED DEFAULT NULL,
  `graph_tree_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `local_graph_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `host_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `site_id` int(10) UNSIGNED DEFAULT '0',
  `host_grouping_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `sort_children_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `graph_regex` varchar(60) DEFAULT '',
  `host_regex` varchar(60) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `graph_tree_items`
--

INSERT INTO `graph_tree_items` (`id`, `parent`, `position`, `graph_tree_id`, `local_graph_id`, `title`, `host_id`, `site_id`, `host_grouping_type`, `sort_children_type`, `graph_regex`, `host_regex`) VALUES
(1, 0, 2, 2, 0, '', 1, 0, 1, 1, '', ''),
(2, 0, 1, 2, 0, '', 2, 0, 1, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `host`
--

CREATE TABLE `host` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `poller_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `site_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `host_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(150) NOT NULL DEFAULT '',
  `hostname` varchar(100) DEFAULT NULL,
  `notes` text,
  `external_id` varchar(40) DEFAULT NULL,
  `snmp_community` varchar(100) DEFAULT NULL,
  `snmp_version` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `snmp_username` varchar(50) DEFAULT NULL,
  `snmp_password` varchar(50) DEFAULT NULL,
  `snmp_auth_protocol` char(5) DEFAULT '',
  `snmp_priv_passphrase` varchar(200) DEFAULT '',
  `snmp_priv_protocol` char(6) DEFAULT '',
  `snmp_context` varchar(64) DEFAULT '',
  `snmp_engine_id` varchar(64) DEFAULT '',
  `snmp_port` mediumint(5) UNSIGNED NOT NULL DEFAULT '161',
  `snmp_timeout` mediumint(8) UNSIGNED NOT NULL DEFAULT '500',
  `snmp_sysDescr` varchar(300) NOT NULL DEFAULT '',
  `snmp_sysObjectID` varchar(64) NOT NULL DEFAULT '',
  `snmp_sysUpTimeInstance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `snmp_sysContact` varchar(300) NOT NULL DEFAULT '',
  `snmp_sysName` varchar(300) NOT NULL DEFAULT '',
  `snmp_sysLocation` varchar(300) NOT NULL DEFAULT '',
  `availability_method` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `ping_method` smallint(5) UNSIGNED DEFAULT '0',
  `ping_port` int(12) UNSIGNED DEFAULT '0',
  `ping_timeout` int(12) UNSIGNED DEFAULT '500',
  `ping_retries` int(12) UNSIGNED DEFAULT '2',
  `max_oids` int(12) UNSIGNED DEFAULT '10',
  `device_threads` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `disabled` char(2) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `status_event_count` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `status_fail_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_rec_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_last_error` varchar(255) DEFAULT '',
  `min_time` decimal(10,5) DEFAULT '9.99999',
  `max_time` decimal(10,5) DEFAULT '0.00000',
  `cur_time` decimal(10,5) DEFAULT '0.00000',
  `avg_time` decimal(10,5) DEFAULT '0.00000',
  `polling_time` double DEFAULT '0',
  `total_polls` int(12) UNSIGNED DEFAULT '0',
  `failed_polls` int(12) UNSIGNED DEFAULT '0',
  `availability` decimal(8,5) NOT NULL DEFAULT '100.00000',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host`
--

INSERT INTO `host` (`id`, `poller_id`, `site_id`, `host_template_id`, `description`, `hostname`, `notes`, `external_id`, `snmp_community`, `snmp_version`, `snmp_username`, `snmp_password`, `snmp_auth_protocol`, `snmp_priv_passphrase`, `snmp_priv_protocol`, `snmp_context`, `snmp_engine_id`, `snmp_port`, `snmp_timeout`, `snmp_sysDescr`, `snmp_sysObjectID`, `snmp_sysUpTimeInstance`, `snmp_sysContact`, `snmp_sysName`, `snmp_sysLocation`, `availability_method`, `ping_method`, `ping_port`, `ping_timeout`, `ping_retries`, `max_oids`, `device_threads`, `disabled`, `status`, `status_event_count`, `status_fail_date`, `status_rec_date`, `status_last_error`, `min_time`, `max_time`, `cur_time`, `avg_time`, `polling_time`, `total_polls`, `failed_polls`, `availability`, `last_updated`) VALUES
(1, 1, 0, 1, 'Local Linux Machine', 'localhost', 'Initial Cacti Device', '', 'public', 0, '', '', '', '', '', '', '', 161, 500, '', '', 0, '', '', '', 0, 2, 23, 400, 1, 10, 1, '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '9.99999', '0.00000', '0.00000', '0.00000', 0, 0, 0, '100.00000', '2018-06-27 12:17:54'),
(2, 1, 0, 1, 'Ubuntu Minion', '10.1.1.12', '', '', 'public', 2, '', '', '', '', '', '', '', 161, 500, '', '', 0, '', '', '', 1, 1, 23, 400, 1, 10, 1, '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '9.99999', '0.00000', '0.00000', '0.00000', 0, 0, 0, '100.00000', '2018-06-27 12:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `host_graph`
--

CREATE TABLE `host_graph` (
  `host_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `graph_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host_graph`
--

INSERT INTO `host_graph` (`host_id`, `graph_template_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `host_snmp_cache`
--

CREATE TABLE `host_snmp_cache` (
  `host_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `snmp_query_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `field_name` varchar(50) NOT NULL DEFAULT '',
  `field_value` varchar(512) DEFAULT NULL,
  `snmp_index` varchar(191) NOT NULL DEFAULT '',
  `oid` text NOT NULL,
  `present` tinyint(4) NOT NULL DEFAULT '1',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host_snmp_cache`
--

INSERT INTO `host_snmp_cache` (`host_id`, `snmp_query_id`, `field_name`, `field_value`, `snmp_index`, `oid`, `present`, `last_updated`) VALUES
(1, 1, 'dskDevice', '/dev/sda1', '/dev/sda1', '', 1, '2018-06-27 12:17:54'),
(1, 1, 'dskDevice', '/dev/sda15', '/dev/sda15', '', 1, '2018-06-27 12:17:54'),
(1, 1, 'dskDevice', '/dev/sdb1', '/dev/sdb1', '', 1, '2018-06-27 12:17:54'),
(1, 1, 'dskMount', '/', '/dev/sda1', '', 1, '2018-06-27 12:17:54'),
(1, 1, 'dskMount', '/boot/efi', '/dev/sda15', '', 1, '2018-06-27 12:17:54'),
(1, 1, 'dskMount', '/mnt', '/dev/sdb1', '', 1, '2018-06-27 12:17:54'),
(2, 1, 'dskDevice', '/dev/sda1', '/dev/sda1', '', 1, '2018-06-27 12:20:52'),
(2, 1, 'dskDevice', '/dev/sda15', '/dev/sda15', '', 1, '2018-06-27 12:20:52'),
(2, 1, 'dskDevice', '/dev/sdb1', '/dev/sdb1', '', 1, '2018-06-27 12:20:52'),
(2, 1, 'dskMount', '/', '/dev/sda1', '', 1, '2018-06-27 12:20:52'),
(2, 1, 'dskMount', '/boot/efi', '/dev/sda15', '', 1, '2018-06-27 12:20:52'),
(2, 1, 'dskMount', '/mnt', '/dev/sdb1', '', 1, '2018-06-27 12:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `host_snmp_query`
--

CREATE TABLE `host_snmp_query` (
  `host_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `snmp_query_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sort_field` varchar(50) NOT NULL DEFAULT '',
  `title_format` varchar(50) NOT NULL DEFAULT '',
  `reindex_method` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host_snmp_query`
--

INSERT INTO `host_snmp_query` (`host_id`, `snmp_query_id`, `sort_field`, `title_format`, `reindex_method`) VALUES
(1, 1, 'dskDevice', '|query_dskDevice|', 1),
(2, 1, 'dskDevice', '|query_dskDevice|', 1);

-- --------------------------------------------------------

--
-- Table structure for table `host_template`
--

CREATE TABLE `host_template` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host_template`
--

INSERT INTO `host_template` (`id`, `hash`, `name`) VALUES
(1, '2d3e47f416738c2d22c87c40218cc55e', 'Local Linux Machine');

-- --------------------------------------------------------

--
-- Table structure for table `host_template_graph`
--

CREATE TABLE `host_template_graph` (
  `host_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `graph_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host_template_graph`
--

INSERT INTO `host_template_graph` (`host_template_id`, `graph_template_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `host_template_snmp_query`
--

CREATE TABLE `host_template_snmp_query` (
  `host_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `snmp_query_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host_template_snmp_query`
--

INSERT INTO `host_template_snmp_query` (`host_template_id`, `snmp_query_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plugin_config`
--

CREATE TABLE `plugin_config` (
  `id` int(8) NOT NULL,
  `directory` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `author` varchar(64) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(8) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plugin_config`
--

INSERT INTO `plugin_config` (`id`, `directory`, `name`, `status`, `author`, `webpage`, `version`) VALUES
(3, 'syslog', 'Syslog Monitoring', 1, 'The Cacti Group', 'http://www.cacti.net', '2.1');

-- --------------------------------------------------------

--
-- Table structure for table `plugin_db_changes`
--

CREATE TABLE `plugin_db_changes` (
  `id` int(10) NOT NULL,
  `plugin` varchar(16) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `column` varchar(64) NOT NULL,
  `method` varchar(16) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_hooks`
--

CREATE TABLE `plugin_hooks` (
  `id` int(8) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `hook` varchar(64) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `function` varchar(128) NOT NULL DEFAULT '',
  `status` int(8) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plugin_hooks`
--

INSERT INTO `plugin_hooks` (`id`, `name`, `hook`, `file`, `function`, `status`) VALUES
(1, 'internal', 'config_arrays', '', 'plugin_config_arrays', 1),
(2, 'internal', 'draw_navigation_text', '', 'plugin_draw_navigation_text', 1),
(3, 'syslog', 'config_arrays', 'setup.php', 'syslog_config_arrays', 1),
(4, 'syslog', 'draw_navigation_text', 'setup.php', 'syslog_draw_navigation_text', 1),
(5, 'syslog', 'config_settings', 'setup.php', 'syslog_config_settings', 1),
(6, 'syslog', 'top_header_tabs', 'setup.php', 'syslog_show_tab', 1),
(7, 'syslog', 'top_graph_header_tabs', 'setup.php', 'syslog_show_tab', 1),
(8, 'syslog', 'top_graph_refresh', 'setup.php', 'syslog_top_graph_refresh', 1),
(9, 'syslog', 'poller_bottom', 'setup.php', 'syslog_poller_bottom', 1),
(10, 'syslog', 'graph_buttons', 'setup.php', 'syslog_graph_buttons', 1),
(11, 'syslog', 'config_insert', 'setup.php', 'syslog_config_insert', 1),
(12, 'syslog', 'utilities_list', 'setup.php', 'syslog_utilities_list', 1),
(13, 'syslog', 'utilities_action', 'setup.php', 'syslog_utilities_action', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plugin_realms`
--

CREATE TABLE `plugin_realms` (
  `id` int(8) NOT NULL,
  `plugin` varchar(32) NOT NULL DEFAULT '',
  `file` text NOT NULL,
  `display` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plugin_realms`
--

INSERT INTO `plugin_realms` (`id`, `plugin`, `file`, `display`) VALUES
(1, 'internal', 'plugins.php', 'Plugin Management'),
(2, 'syslog', 'syslog.php', 'Plugin -> Syslog User'),
(3, 'syslog', 'syslog_alerts.php,syslog_removal.php,syslog_reports.php', 'Plugin -> Syslog Administration');

-- --------------------------------------------------------

--
-- Table structure for table `poller`
--

CREATE TABLE `poller` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `disabled` char(2) DEFAULT '',
  `name` varchar(30) DEFAULT NULL,
  `notes` varchar(1024) DEFAULT '',
  `status` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `dbdefault` varchar(20) NOT NULL DEFAULT 'cacti',
  `dbhost` varchar(64) NOT NULL DEFAULT 'cacti',
  `dbuser` varchar(20) NOT NULL DEFAULT '',
  `dbpass` varchar(64) NOT NULL DEFAULT '',
  `dbport` int(10) UNSIGNED DEFAULT '3306',
  `dbssl` char(3) DEFAULT '',
  `total_time` double DEFAULT '0',
  `snmp` mediumint(8) UNSIGNED DEFAULT '0',
  `script` mediumint(8) UNSIGNED DEFAULT '0',
  `server` mediumint(8) UNSIGNED DEFAULT '0',
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_status` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Pollers for Cacti';

--
-- Dumping data for table `poller`
--

INSERT INTO `poller` (`id`, `disabled`, `name`, `notes`, `status`, `hostname`, `dbdefault`, `dbhost`, `dbuser`, `dbpass`, `dbport`, `dbssl`, `total_time`, `snmp`, `script`, `server`, `last_update`, `last_status`) VALUES
(1, '', 'Main Poller', '', 0, 'localhost', 'cacti', 'cacti', '', '', 3306, '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `poller_command`
--

CREATE TABLE `poller_command` (
  `poller_id` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `command` varchar(191) NOT NULL DEFAULT '',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poller_data_template_field_mappings`
--

CREATE TABLE `poller_data_template_field_mappings` (
  `data_template_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data_name` varchar(40) NOT NULL DEFAULT '',
  `data_source_names` varchar(125) NOT NULL DEFAULT '',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tracks mapping of Data Templates to their Data Source Names';

--
-- Dumping data for table `poller_data_template_field_mappings`
--

INSERT INTO `poller_data_template_field_mappings` (`data_template_id`, `data_name`, `data_source_names`, `last_updated`) VALUES
(1, 'proc', 'proc', '2018-06-27 12:17:58'),
(2, '10min', 'load_15min', '2018-06-27 12:17:58'),
(2, '1min', 'load_1min', '2018-06-27 12:17:58'),
(2, '5min', 'load_5min', '2018-06-27 12:17:58'),
(3, 'users', 'users', '2018-06-27 12:17:58'),
(4, 'kilobytes', 'mem_buffers', '2018-06-27 12:17:58'),
(5, 'kilobytes', 'mem_swap', '2018-06-27 12:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `poller_item`
--

CREATE TABLE `poller_item` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `poller_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `host_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `action` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `present` tinyint(4) NOT NULL DEFAULT '1',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `snmp_community` varchar(100) NOT NULL DEFAULT '',
  `snmp_version` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `snmp_username` varchar(50) NOT NULL DEFAULT '',
  `snmp_password` varchar(50) NOT NULL DEFAULT '',
  `snmp_auth_protocol` varchar(5) NOT NULL DEFAULT '',
  `snmp_priv_passphrase` varchar(200) NOT NULL DEFAULT '',
  `snmp_priv_protocol` varchar(6) NOT NULL DEFAULT '',
  `snmp_context` varchar(64) DEFAULT '',
  `snmp_engine_id` varchar(64) DEFAULT '',
  `snmp_port` mediumint(5) UNSIGNED NOT NULL DEFAULT '161',
  `snmp_timeout` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `rrd_name` varchar(19) NOT NULL DEFAULT '',
  `rrd_path` varchar(255) NOT NULL DEFAULT '',
  `rrd_num` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `rrd_step` mediumint(8) NOT NULL DEFAULT '300',
  `rrd_next_step` mediumint(8) NOT NULL DEFAULT '0',
  `arg1` text,
  `arg2` varchar(255) DEFAULT NULL,
  `arg3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poller_item`
--

INSERT INTO `poller_item` (`local_data_id`, `poller_id`, `host_id`, `action`, `present`, `last_updated`, `hostname`, `snmp_community`, `snmp_version`, `snmp_username`, `snmp_password`, `snmp_auth_protocol`, `snmp_priv_passphrase`, `snmp_priv_protocol`, `snmp_context`, `snmp_engine_id`, `snmp_port`, `snmp_timeout`, `rrd_name`, `rrd_path`, `rrd_num`, `rrd_step`, `rrd_next_step`, `arg1`, `arg2`, `arg3`) VALUES
(1, 1, 1, 1, 1, '2018-06-27 12:17:57', 'localhost', 'public', 0, '', '', '', '', '', '', '', 161, 500, 'proc', '/var/www/html/cacti/rra/local_linux_machine_proc_1.rrd', 1, 300, 0, 'perl /var/www/html/cacti/scripts/unix_processes.pl', '', ''),
(2, 1, 1, 1, 1, '2018-06-27 12:17:57', 'localhost', 'public', 0, '', '', '', '', '', '', '', 161, 500, '', '/var/www/html/cacti/rra/local_linux_machine_load_1min_2.rrd', 1, 300, 0, 'perl /var/www/html/cacti/scripts/loadavg_multi.pl', '', ''),
(3, 1, 1, 1, 1, '2018-06-27 12:17:57', 'localhost', 'public', 0, '', '', '', '', '', '', '', 161, 500, 'users', '/var/www/html/cacti/rra/local_linux_machine_users_3.rrd', 1, 300, 0, 'perl /var/www/html/cacti/scripts/unix_users.pl \'\'', '', ''),
(4, 1, 1, 1, 1, '2018-06-27 12:17:57', 'localhost', 'public', 0, '', '', '', '', '', '', '', 161, 500, 'mem_buffers', '/var/www/html/cacti/rra/local_linux_machine_mem_buffers_4.rrd', 1, 300, 0, 'perl /var/www/html/cacti/scripts/linux_memory.pl \'MemFree:\'', '', ''),
(5, 1, 1, 1, 1, '2018-06-27 12:17:57', 'localhost', 'public', 0, '', '', '', '', '', '', '', 161, 500, 'mem_swap', '/var/www/html/cacti/rra/local_linux_machine_mem_swap_5.rrd', 1, 300, 0, 'perl /var/www/html/cacti/scripts/linux_memory.pl \'SwapFree:\'', '', ''),
(6, 1, 2, 1, 1, '2018-06-27 12:21:50', '10.1.1.12', 'public', 2, '', '', '', '', '', '', '', 161, 500, 'mem_buffers', '/var/www/html/cacti/rra/ubuntu_minion_mem_buffers_6.rrd', 1, 300, 0, 'perl /var/www/html/cacti/scripts/linux_memory.pl \'MemFree:\'', '', ''),
(7, 1, 2, 1, 1, '2018-06-27 12:21:50', '10.1.1.12', 'public', 2, '', '', '', '', '', '', '', 161, 500, 'mem_swap', '/var/www/html/cacti/rra/ubuntu_minion_mem_swap_7.rrd', 1, 300, 0, 'perl /var/www/html/cacti/scripts/linux_memory.pl \'SwapFree:\'', '', ''),
(8, 1, 2, 1, 1, '2018-06-27 12:21:51', '10.1.1.12', 'public', 2, '', '', '', '', '', '', '', 161, 500, '', '/var/www/html/cacti/rra/ubuntu_minion_load_1min_8.rrd', 1, 300, 0, 'perl /var/www/html/cacti/scripts/loadavg_multi.pl', '', ''),
(9, 1, 2, 1, 1, '2018-06-27 12:21:52', '10.1.1.12', 'public', 2, '', '', '', '', '', '', '', 161, 500, 'users', '/var/www/html/cacti/rra/ubuntu_minion_users_9.rrd', 1, 300, 0, 'perl /var/www/html/cacti/scripts/unix_users.pl \'\'', '', ''),
(10, 1, 2, 1, 1, '2018-06-27 12:21:52', '10.1.1.12', 'public', 2, '', '', '', '', '', '', '', 161, 500, 'proc', '/var/www/html/cacti/rra/ubuntu_minion_proc_10.rrd', 1, 300, 0, 'perl /var/www/html/cacti/scripts/unix_processes.pl', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `poller_output`
--

CREATE TABLE `poller_output` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `rrd_name` varchar(19) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `output` varchar(512) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poller_output_boost`
--

CREATE TABLE `poller_output_boost` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `rrd_name` varchar(19) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `output` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poller_output_boost_processes`
--

CREATE TABLE `poller_output_boost_processes` (
  `sock_int_value` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poller_output_realtime`
--

CREATE TABLE `poller_output_realtime` (
  `local_data_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `rrd_name` varchar(19) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `output` text NOT NULL,
  `poller_id` varchar(256) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poller_reindex`
--

CREATE TABLE `poller_reindex` (
  `host_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `data_query_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `action` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `present` tinyint(4) NOT NULL DEFAULT '1',
  `op` char(1) NOT NULL DEFAULT '',
  `assert_value` varchar(100) NOT NULL DEFAULT '',
  `arg1` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poller_reindex`
--

INSERT INTO `poller_reindex` (`host_id`, `data_query_id`, `action`, `present`, `op`, `assert_value`, `arg1`) VALUES
(2, 1, 0, 1, '<', '', '.1.3.6.1.2.1.1.3.0');

-- --------------------------------------------------------

--
-- Table structure for table `poller_resource_cache`
--

CREATE TABLE `poller_resource_cache` (
  `id` int(10) UNSIGNED NOT NULL,
  `resource_type` varchar(20) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contents` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Caches all scripts, resources files, and plugins';

-- --------------------------------------------------------

--
-- Table structure for table `poller_time`
--

CREATE TABLE `poller_time` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `poller_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `cformat` char(2) NOT NULL DEFAULT '',
  `format_file` varchar(255) NOT NULL DEFAULT '',
  `font_size` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `alignment` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `graph_linked` char(2) NOT NULL DEFAULT '',
  `intrvl` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `count` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `offset` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `mailtime` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `from_name` varchar(40) NOT NULL,
  `from_email` text NOT NULL,
  `email` text NOT NULL,
  `bcc` text NOT NULL,
  `attachment_type` smallint(2) UNSIGNED NOT NULL DEFAULT '1',
  `graph_height` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `graph_width` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `graph_columns` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `thumbnails` char(2) NOT NULL DEFAULT '',
  `lastsent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `enabled` char(2) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cacri Reporting Reports';

-- --------------------------------------------------------

--
-- Table structure for table `reports_items`
--

CREATE TABLE `reports_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `item_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `tree_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `branch_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tree_cascade` char(2) NOT NULL DEFAULT '',
  `graph_name_regexp` varchar(128) NOT NULL DEFAULT '',
  `host_template_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `host_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `graph_template_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `local_graph_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `timespan` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `align` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `item_text` text NOT NULL,
  `font_size` smallint(2) UNSIGNED NOT NULL DEFAULT '10',
  `sequence` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cacti Reporting Items';

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL,
  `remote_addr` varchar(25) NOT NULL DEFAULT '',
  `access` int(10) UNSIGNED DEFAULT NULL,
  `data` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Used for Database based Session Storage';

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`name`, `value`) VALUES
('automation_graphs_enabled', ''),
('automation_tree_enabled', ''),
('default_datechar', '1'),
('default_date_format', '4'),
('default_graph_height', '150'),
('default_graph_width', '500'),
('default_has', ''),
('default_image_format', '1'),
('deletion_verification', 'on'),
('developer_mode', ''),
('drag_and_drop', 'on'),
('force_https', ''),
('graph_auth_method', '1'),
('grds_creation_method', '0'),
('hide_console', '0'),
('hide_form_description', 'on'),
('i18n_auto_detection', '0'),
('i18n_default_language', 'en'),
('i18n_language_support', '1'),
('log_destination', '1'),
('log_graph', ''),
('log_perror', 'on'),
('log_pstats', ''),
('log_pwarn', ''),
('log_snmp', ''),
('log_verbosity', '2'),
('path_cactilog', '/var/www/html/cacti/log/cacti.log'),
('path_php_binary', '/usr/bin/php'),
('path_rrdtool', '/usr/bin/rrdtool'),
('path_snmpbulkwalk', '/usr/bin/snmpbulkwalk'),
('path_snmpget', '/usr/bin/snmpget'),
('path_snmpgetnext', '/usr/bin/snmpgetnext'),
('path_snmptrap', '/usr/bin/snmptrap'),
('path_snmpwalk', '/usr/bin/snmpwalk'),
('path_spine', '/usr/local/spine/bin/spine'),
('poller_replicate_data_input_crc', '8abcecdb390785a93f038da832c0d558ceed6703'),
('poller_replicate_data_input_fields_crc', 'f8e72ed650477d557936740d8ba8e41d1c42af0c'),
('poller_replicate_data_source_cache_crc_1', 'c06107810fb522914968b973a72aa4e641c0da2a'),
('poller_replicate_device_cache_crc_1', 'a86a4073f2cf12e26bc8f69fe41295d4777bbf20'),
('poller_replicate_snmp_query_crc', 'bba2f38565fcd71fcd4d5df0b041240d20c3ff1e'),
('rrdtool_version', 'rrd-1.6.x'),
('rsa_fingerprint', '12:54:a1:ef:72:69:68:a5:f0:95:5b:5b:6c:e7:3b:42'),
('rsa_private_key', '-----BEGIN RSA PRIVATE KEY-----MIIEogIBAAKCAQEAtcnk6T3G7in2IHa4PVyyr0xYkmF5+gS5xWJM5WEmt61l1bBjfR8D3E9oam6XJXV4K7NzqDOWg5OGhtdwqfcXc29Q2BBLy5rnSxS8QUFiVGp3lU9O6PIQppjIkSGg81wimTQsjL0sq2Ww2umOJh27ozK+w84cbDCJZAWmctTpysBoE8ANiyNmu2Evv4pzeJ5U6+CcvZFkMugPD5cVuggFFNCgRMV+D+oIjyMKbiehVLi+AC9LmKJvICUF8vIgxKaK7x3XkbB+iy0/HQg1pPqKjcUrQZorC6Q0jPb/5RhEO8gyBjj8jn42hMgkWp5jKbAZKKEkz3ZgD2EFCtsn/O73qwIDAQABAoIBAFOgIJG7PXvqCbM9aduwfPJvKH+OH9KHwf2vDrimTG1KcwIuNlYkol4CmYH8hcNRmopf7uB9esvkXYpCKS3G4R7VIleCh5uOEsBTNZa/QUCcCY7CAQbf9BDvT7STx7qrs67OdX/4tkfSa90Ie7/FBcA5Y9AnTKPoYAuHHd7NWw9NVKNglWltQCNMwaONdJliplA0mrS/Z6eFRh8a+Ub73+0gKWUWwAwTtmUiqmzZ40fBKFU7pZ4jtZLbFk9YnrW+14Vg4w2m/czOPHNAdMSdH5dyk5+46bG9hLAfEdHKK6KNF3cws8io+sZH1j5OZYblhz9uHtm4K+43cfiuj0xMsIECgYEA5urRm1w2eBCtI1leE7gl58RJwrJRY3UI9HaQfzhshu4MZqv/9u+vz5+HJUor7aGL3JxushzHw6IU73IUQR8cVKlL2hWXwjDH3xTqC58mwSg1idsuDxMxuGrpL2dY1560RuA+KbqMPs6opiVBRhZLltflMisqKry2Uy1mXusBMzsCgYEAyYjxOXo0fCErFynkTCEktA0Jh4eUrRfWxLHygsodUbc44EGUih/1LtdHzLB2hWP/VOMOZBMO+sfdZq0IAfdIRhCgXM4bSa+3u0BKHZ29eC4CNHPM3Z7rjV+rgEG69nDHwAschrunNrllQRX5UtUkMZISm+20vazZ59XpScapJlECgYANClO9904oJ6DvbxuN94dEeGRF93X7LN/NlmiAlroiQI04uxvgYRbHndWu+GpUqBvS4I6rxk5NsPiHsSSNrOkXqtvau/9u+vw+j9rLvzgcDl4/o74NIeNb68WxZJ+yxYaevgkkqCFFZrxFbbMq9xVbtmN+Gsvtz+xn9Bdk4taVgwKBgCNew2dhCUEX2SYxlf2+e2CWQSvmIbPXUTwoNvW5XzfuPi8tk1JClZdo9RL5jXOPv0o4p1fs+F4PIc5ZY+Rkb+zMEjj3e1aNXmOgvuE/w/cJrB1kjXn/4DtppQHXh2alGImd6Z3D5W73TswDfUSKX9XLWzS+nVAEvCGyK0Vldl5hAoGAabeoEUE7Qy5yAceOwtpvakDNi7pXEXh0ht2Lutq9ks3TyJxDnL/RLFy+BaEFV9B/cmi83VsjemQKXmRddYxwzAuwMg6Doip8PrE7GdZWI7kjqckR3ychBGNmugVLJ8jYzHbND33ExkmtB54I1dJmNKJ4NXb3fPpE7YRw0r9dYWQ=-----END RSA PRIVATE KEY-----'),
('rsa_public_key', '-----BEGIN PUBLIC KEY-----MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtcnk6T3G7in2IHa4PVyyr0xYkmF5+gS5xWJM5WEmt61l1bBjfR8D3E9oam6XJXV4K7NzqDOWg5OGhtdwqfcXc29Q2BBLy5rnSxS8QUFiVGp3lU9O6PIQppjIkSGg81wimTQsjL0sq2Ww2umOJh27ozK+w84cbDCJZAWmctTpysBoE8ANiyNmu2Evv4pzeJ5U6+CcvZFkMugPD5cVuggFFNCgRMV+D+oIjyMKbiehVLi+AC9LmKJvICUF8vIgxKaK7x3XkbB+iy0/HQg1pPqKjcUrQZorC6Q0jPb/5RhEO8gyBjj8jn42hMgkWp5jKbAZKKEkz3ZgD2EFCtsn/O73qwIDAQAB-----END PUBLIC KEY-----'),
('selected_theme', 'modern'),
('selective_debug', ''),
('selective_device_debug', ''),
('selective_plugin_debug', ''),
('syslog_alert_retention', '2'),
('syslog_domains', ''),
('syslog_enabled', 'on'),
('syslog_html', 'on'),
('syslog_maxrecords', '100'),
('syslog_refresh', '300'),
('syslog_retention', '2'),
('syslog_statistics', ''),
('syslog_ticket_command', ''),
('syslog_validate_hostname', '');

-- --------------------------------------------------------

--
-- Table structure for table `settings_tree`
--

CREATE TABLE `settings_tree` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `graph_tree_item_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings_user`
--

CREATE TABLE `settings_user` (
  `user_id` smallint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings_user_group`
--

CREATE TABLE `settings_user_group` (
  `group_id` smallint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the Default User Group Graph Settings';

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `address1` varchar(100) DEFAULT '',
  `address2` varchar(100) DEFAULT '',
  `city` varchar(50) DEFAULT '',
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT '',
  `country` varchar(30) DEFAULT '',
  `timezone` varchar(40) DEFAULT '',
  `latitude` decimal(13,10) NOT NULL DEFAULT '0.0000000000',
  `longitude` decimal(13,10) NOT NULL DEFAULT '0.0000000000',
  `alternate_id` varchar(30) DEFAULT '',
  `notes` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains information about customer sites';

-- --------------------------------------------------------

--
-- Table structure for table `snmpagent_cache`
--

CREATE TABLE `snmpagent_cache` (
  `oid` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `mib` varchar(191) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `otype` varchar(255) NOT NULL DEFAULT '',
  `kind` varchar(255) NOT NULL DEFAULT '',
  `max-access` varchar(255) NOT NULL DEFAULT 'not-accessible',
  `value` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(5000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='SNMP MIB CACHE';

--
-- Dumping data for table `snmpagent_cache`
--

INSERT INTO `snmpagent_cache` (`oid`, `name`, `mib`, `type`, `otype`, `kind`, `max-access`, `value`, `description`) VALUES
('.1.3.6.1.4.1.23925', 'cacti', 'CACTI-MIB', '', 'MODULE-IDENTITY', 'Node', 'not-accessible', '', 'Initial version of this MIB module.'),
('.1.3.6.1.4.1.23925.1', 'cactiAppl', 'CACTI-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'reserved for Cacti application data'),
('.1.3.6.1.4.1.23925.1.1.0', 'cactiApplLastUpdate', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '1530171405', 'Unix timestamp when this data has been updated for the last time.'),
('.1.3.6.1.4.1.23925.1.10.0', 'cactiApplSpineMaxThreads', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '1', 'Represents the maximum threads allowed per process.'),
('.1.3.6.1.4.1.23925.1.11.0', 'cactiApplSpineScriptServers', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '1', 'Represents the maximum number of script servers a spine process is<br>allowed to run.'),
('.1.3.6.1.4.1.23925.1.12.0', 'cactiApplSpineScriptTimeout', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '25', 'Describes the maximum time Cacti will wait on a script to complete.'),
('.1.3.6.1.4.1.23925.1.13.0', 'cactiApplSpineMaxOids', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '10', 'The maximum number of snmp get OID\'s to issue per snmpbulkwalk<br>request.'),
('.1.3.6.1.4.1.23925.1.14', 'cactiApplDeviceTable', 'CACTI-MIB', 'SEQUENCE OF', 'OBJECT-TYPE', 'Table', 'not-accessible', '', 'A table of registered hosts on a Cacti system.<br>The maximum number of entries is implementation dependent.'),
('.1.3.6.1.4.1.23925.1.14.1', 'cactiApplDeviceEntry', 'CACTI-MIB', 'CactiApplDeviceEntry', 'OBJECT-TYPE', 'Row', 'not-accessible', '', 'An entry in the table of registered hosts on a Cacti system. A row<br>in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),
('.1.3.6.1.4.1.23925.1.14.1.1', 'cactiApplDeviceIndex', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'A unique device identifier. This ID will be created by Cacti itself.'),
('.1.3.6.1.4.1.23925.1.14.1.1.1', 'cactiApplDeviceIndex', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Column Data', 'read-only', '1', ''),
('.1.3.6.1.4.1.23925.1.14.1.1.2', 'cactiApplDeviceIndex', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Column Data', 'read-only', '2', ''),
('.1.3.6.1.4.1.23925.1.14.1.2', 'cactiApplDeviceDescription', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'A meaning description of a device.'),
('.1.3.6.1.4.1.23925.1.14.1.2.1', 'cactiApplDeviceDescription', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', 'Local Linux Machine', ''),
('.1.3.6.1.4.1.23925.1.14.1.2.2', 'cactiApplDeviceDescription', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', 'Ubuntu Minion', ''),
('.1.3.6.1.4.1.23925.1.14.1.3', 'cactiApplDeviceHostname', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Fully qualified devicename or IP address.'),
('.1.3.6.1.4.1.23925.1.14.1.3.1', 'cactiApplDeviceHostname', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', 'localhost', ''),
('.1.3.6.1.4.1.23925.1.14.1.3.2', 'cactiApplDeviceHostname', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '10.1.1.12', ''),
('.1.3.6.1.4.1.23925.1.14.1.4', 'cactiApplDeviceStatus', 'CACTI-MIB', 'INTEGER', 'OBJECT-TYPE', 'Column', 'read-only', '', 'The status a device can have within Cacti:<br>unknown(0)     - device has not been polled yet<br>down(1)        - device became unresponsive<br>recovering(2)  - device was down and became reachable again<br>up(3)          - device is reachable<br>disabled(4)    - device will not be monitored'),
('.1.3.6.1.4.1.23925.1.14.1.4.1', 'cactiApplDeviceStatus', 'CACTI-MIB', 'INTEGER', 'DATA', 'Column Data', 'read-only', '0', ''),
('.1.3.6.1.4.1.23925.1.14.1.4.2', 'cactiApplDeviceStatus', 'CACTI-MIB', 'INTEGER', 'DATA', 'Column Data', 'read-only', '0', ''),
('.1.3.6.1.4.1.23925.1.14.1.5', 'cactiApplDeviceEventCount', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Total number of events registered for that device since last reset.'),
('.1.3.6.1.4.1.23925.1.14.1.5.1', 'cactiApplDeviceEventCount', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Column Data', 'read-only', '0', ''),
('.1.3.6.1.4.1.23925.1.14.1.5.2', 'cactiApplDeviceEventCount', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Column Data', 'read-only', '0', ''),
('.1.3.6.1.4.1.23925.1.14.1.6', 'cactiApplDeviceFailDate', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Date of last fail'),
('.1.3.6.1.4.1.23925.1.14.1.6.1', 'cactiApplDeviceFailDate', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '0000-00-00 00:00:00', ''),
('.1.3.6.1.4.1.23925.1.14.1.6.2', 'cactiApplDeviceFailDate', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '0000-00-00 00:00:00', ''),
('.1.3.6.1.4.1.23925.1.14.1.7', 'cactiApplDeviceRecoveryDate', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Date of lats recovery'),
('.1.3.6.1.4.1.23925.1.14.1.7.1', 'cactiApplDeviceRecoveryDate', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '0000-00-00 00:00:00', ''),
('.1.3.6.1.4.1.23925.1.14.1.7.2', 'cactiApplDeviceRecoveryDate', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '0000-00-00 00:00:00', ''),
('.1.3.6.1.4.1.23925.1.14.1.8', 'cactiApplDeviceLastError', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Description of last error being detected.'),
('.1.3.6.1.4.1.23925.1.14.1.8.1', 'cactiApplDeviceLastError', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '', ''),
('.1.3.6.1.4.1.23925.1.14.1.8.2', 'cactiApplDeviceLastError', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '', ''),
('.1.3.6.1.4.1.23925.1.15', 'cactiApplPollerTable', 'CACTI-MIB', 'SEQUENCE OF', 'OBJECT-TYPE', 'Table', 'not-accessible', '', 'A table of pollers registered on a Cacti system.<br>The maximum number of entries is implementation dependent.'),
('.1.3.6.1.4.1.23925.1.15.1', 'cactiApplPollerEntry', 'CACTI-MIB', 'CactiApplPollerEntry', 'OBJECT-TYPE', 'Row', 'not-accessible', '', 'An entry in the table of registered pollers to a Cacti system. A row<br>in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),
('.1.3.6.1.4.1.23925.1.15.1.1', 'cactiApplPollerIndex', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'A unique poller identifier. This ID will be created by Cacti itself.'),
('.1.3.6.1.4.1.23925.1.15.1.2', 'cactiApplPollerHostname', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Name of the device where the poller is running on.'),
('.1.3.6.1.4.1.23925.1.15.1.3', 'cactiApplPollerIpAddress', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'IP address of the poller\'s host.'),
('.1.3.6.1.4.1.23925.1.15.1.4', 'cactiApplPollerLastUpdate', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Timestamp of last update.'),
('.1.3.6.1.4.1.23925.1.16', 'cactiApplPluginTable', 'CACTI-MIB', 'SEQUENCE OF', 'OBJECT-TYPE', 'Table', 'not-accessible', '', 'A table of registered plugins on a Cacti system.<br>The maximum number of entries is implementation dependent.'),
('.1.3.6.1.4.1.23925.1.16.1', 'cactiApplPluginEntry', 'CACTI-MIB', 'CactiApplPluginEntry', 'OBJECT-TYPE', 'Row', 'not-accessible', '', 'An entry in the table of all installed Cacti plugins. A row<br>in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),
('.1.3.6.1.4.1.23925.1.16.1.1', 'cactiApplPluginIndex', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'A unique plugin identifier. This ID will be administrated by Cacti itself.'),
('.1.3.6.1.4.1.23925.1.16.1.2', 'cactiApplPluginType', 'CACTI-MIB', 'INTEGER', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Describes whether or not the plugin has been registered as a system plugin.<br>System plugins offer a lot of functions normal Cacti plugins rely on.'),
('.1.3.6.1.4.1.23925.1.16.1.3', 'cactiApplPluginName', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'The official name of a plugin given by its author.'),
('.1.3.6.1.4.1.23925.1.16.1.4', 'cactiApplPluginStatus', 'CACTI-MIB', 'INTEGER', 'OBJECT-TYPE', 'Column', 'read-only', '', 'The status a plugin can have within Cacti:<br>disabledold(-2)   - plugin (old PIA) is available, but has not been installed<br>activeold(-1)     - plugin (old PIA) is installed and active<br>notinstalled(0)   - plugin (new PIA) is available, but has not been installed<br>active(1)         - plugin (new PIA) is installed and active<br>setupmode(2)      - plugin (new PIA) is installed, but configuration is needed<br>disabled(4)       - plugin (new PIA) is installed, but without function'),
('.1.3.6.1.4.1.23925.1.16.1.5', 'cactiApplPluginVersion', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Version string of the Cacti plugin being installed.'),
('.1.3.6.1.4.1.23925.1.2.0', 'cactiApplVersion', 'CACTI-MIB', 'DisplayString', 'DATA', 'Scalar', 'read-only', '1.1.18', 'Returns the version string of Cacti'),
('.1.3.6.1.4.1.23925.1.3.0', 'cactiApplSnmpVersion', 'CACTI-MIB', 'TcCactiApplSnmpVersion', 'DATA', 'Scalar', 'read-only', '3', 'Represents the type of SNMP used by Cacti:<br><br>NET-SNMP<br>UCD-SNMP<br>PHP-SNMP'),
('.1.3.6.1.4.1.23925.1.4.0', 'cactiApplRrdtoolVersion', 'CACTI-MIB', 'DisplayString', 'DATA', 'Scalar', 'read-only', 'rrd-1.6.x', 'The version of RRDTool used by Cacti'),
('.1.3.6.1.4.1.23925.1.5.0', 'cactiApplPollerEnabled', 'CACTI-MIB', 'TruthValue', 'DATA', 'Scalar', 'read-only', '1', 'If Cacti polling has been enabled this object is set to true(1).'),
('.1.3.6.1.4.1.23925.1.6.0', 'cactiApplPollerType', 'CACTI-MIB', 'TcCactiApplPollerType', 'DATA', 'Scalar', 'read-only', '1', 'Describes the polling engine used by Cacti:<br><br>cmd         - php based poller<br>spine       - high performance C-based polling engine'),
('.1.3.6.1.4.1.23925.1.7.0', 'cactiApplPollerInterval', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '300', 'The polling interval in seconds which determines how often<br>data sources will be checked and updated.'),
('.1.3.6.1.4.1.23925.1.8.0', 'cactiApplPollerMaxProcesses', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '1', 'Represents the number of maximum poller processes Cacti is allowed to<br>perform in parallel.'),
('.1.3.6.1.4.1.23925.1.9.0', 'cactiApplPollerLoadBalance', 'CACTI-MIB', 'TruthValue', 'DATA', 'Scalar', 'read-only', '1', 'If true Cacti attempt to balance the load of each poller process.'),
('.1.3.6.1.4.1.23925.2', 'cactiStats', 'CACTI-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'reserved for cacti statistics'),
('.1.3.6.1.4.1.23925.2.1.0', 'cactiStatsLastUpdate', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '1530102054', 'Unix timestamp when this data has been updated for the last time.'),
('.1.3.6.1.4.1.23925.2.10', 'cactiStatsPollerTable', 'CACTI-MIB', 'SEQUENCE OF', 'OBJECT-TYPE', 'Table', 'not-accessible', '', 'A table of statistics for all pollers registered on a Cacti system.<br>The maximum number of entries is implementation dependent.<br>This table has a 1:1 relationship to cactiApplPollerTable.'),
('.1.3.6.1.4.1.23925.2.10.1', 'cactiStatsPollerEntry', 'CACTI-MIB', 'CactiStatsPollerEntry', 'OBJECT-TYPE', 'Row', 'not-accessible', '', 'An entry in the table of statistics for registered pollers of a Cacti system.<br>A row in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),
('.1.3.6.1.4.1.23925.2.10.1.1', 'cactiStatsPollerIndex', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'A unique poller identifier. This ID will be created by Cacti itself.'),
('.1.3.6.1.4.1.23925.2.10.1.10', 'cactiStatsPollerRrrdsProcessed', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Number of RRDs being processed. This object will always return zero<br>if RRD updates will be handled by BOOST.'),
('.1.3.6.1.4.1.23925.2.10.1.11', 'cactiStatsPollerUtilization', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'The proportion of the poller interval in percent the poller requires<br>to poll all data sources.'),
('.1.3.6.1.4.1.23925.2.10.1.2', 'cactiStatsPollerHostname', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Name of the device where the poller is running on.'),
('.1.3.6.1.4.1.23925.2.10.1.3', 'cactiStatsPollerRunTime', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Last poller runtime in seconds.'),
('.1.3.6.1.4.1.23925.2.10.1.4', 'cactiStatsPollerMethod', 'CACTI-MIB', 'TcCactiApplPollerType', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Describes the polling engine used by Cacti:<br>cmd         - php based poller<br>spine       - high performance C-based polling engine'),
('.1.3.6.1.4.1.23925.2.10.1.5', 'cactiStatsPollerConcurrentProcesses', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Number of concurrent processes.'),
('.1.3.6.1.4.1.23925.2.10.1.6', 'cactiStatsPollerThreads', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Number of threads. This object will always return zero if<br>polling method is CMD.'),
('.1.3.6.1.4.1.23925.2.10.1.7', 'cactiStatsPollerHosts', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Number of polled devices.'),
('.1.3.6.1.4.1.23925.2.10.1.8', 'cactiStatsPollerHostsPerProcess', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Maximum number of hosts per process.'),
('.1.3.6.1.4.1.23925.2.10.1.9', 'cactiStatsPollerItems', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Number of items being polled.'),
('.1.3.6.1.4.1.23925.2.11.0', 'cactiStatsTotalsDeviceStatusUnknown', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Total number of devices that have not been polled yet.'),
('.1.3.6.1.4.1.23925.2.12.0', 'cactiStatsTotalsDeviceStatusDown', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Total number of devices being unreachable.'),
('.1.3.6.1.4.1.23925.2.13.0', 'cactiStatsTotalsDeviceStatusRecovering', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Total number of devices recovering.'),
('.1.3.6.1.4.1.23925.2.14.0', 'cactiStatsTotalsDeviceStatusUp', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Total number of devices being reachable.'),
('.1.3.6.1.4.1.23925.2.15.0', 'cactiStatsTotalsDeviceStatusDisabled', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Total number of devices being reachable.'),
('.1.3.6.1.4.1.23925.2.2.0', 'cactiStatsRecacheTime', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Returns the recache Time in seconds.'),
('.1.3.6.1.4.1.23925.2.3.0', 'cactiStatsRecachedHosts', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'The current number of recaching events being discovered.'),
('.1.3.6.1.4.1.23925.2.4.0', 'cactiStatsLocalPollerRuntime', 'CACTI-MIB', 'DisplayString', 'DATA', 'Scalar', 'read-only', '', 'Returns the runtime of the local poller in seconds.'),
('.1.3.6.1.4.1.23925.2.5.0', 'cactiStatsTotalsDevices', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '2', 'Returns the total number of registered devices.'),
('.1.3.6.1.4.1.23925.2.6.0', 'cactiStatsTotalsDataSources', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Returns the total number of data sources.'),
('.1.3.6.1.4.1.23925.2.7.0', 'cactiStatsTotalsGraphs', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Returns the total number of graphs.'),
('.1.3.6.1.4.1.23925.2.8', 'cactiStatsTotalsDeviceStatusTable', 'CACTI-MIB', 'SEQUENCE OF', 'OBJECT-TYPE', 'Table', 'not-accessible', '', 'A table of statistics for all devices registered on a Cacti system<br>in relation to their device status.<br>The maximum number of entries is limited to maximum number of<br>device stati.'),
('.1.3.6.1.4.1.23925.2.8.1', 'cactiStatsTotalsDeviceStatusEntry', 'CACTI-MIB', 'CactiStatsTotalsDeviceStatusEntry', 'OBJECT-TYPE', 'Row', 'not-accessible', '', 'A table of statistics for all devices registered on a Cacti system<br>in relation to their device status.<br>A row in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),
('.1.3.6.1.4.1.23925.2.8.1.1', 'cactiStatsTotalsDeviceStatusIndex', 'CACTI-MIB', 'INTEGER', 'OBJECT-TYPE', 'Column', 'read-only', '', 'unknown(0)     - Total number of devices that have not been polled yet<br>down(1)        - Total number of devices being unreachable<br>recovering(2)  - Total number of devices recovering<br>up(3)          - Total number of devices being reachable<br>disabled(4)    - Total number of devices that will not be monitored'),
('.1.3.6.1.4.1.23925.2.8.1.2', 'cactiStatsTotalsDeviceStatusCounter', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Returns the total number of registered devices in relation to<br>cactiStatsTotalsDeviceStatusIndex.'),
('.1.3.6.1.4.1.23925.2.9', 'cactiStatsDeviceTable', 'CACTI-MIB', 'SEQUENCE OF', 'OBJECT-TYPE', 'Table', 'not-accessible', '', 'A table of statistics for all devices registered on a Cacti system.<br>The maximum number of entries is implementation dependent.<br>This table has a 1:1 relationship to cactiApplDeviceTable.'),
('.1.3.6.1.4.1.23925.2.9.1', 'cactiStatsDeviceEntry', 'CACTI-MIB', 'CactiStatsDeviceEntry', 'OBJECT-TYPE', 'Row', 'not-accessible', '', 'An entry in the table of statistics for registered devices of a Cacti system.<br>A row in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),
('.1.3.6.1.4.1.23925.2.9.1.1', 'cactiStatsDeviceIndex', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'A unique device identifier. This ID will be created by Cacti itself.'),
('.1.3.6.1.4.1.23925.2.9.1.1.1', 'cactiStatsDeviceIndex', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Column Data', 'read-only', '1', ''),
('.1.3.6.1.4.1.23925.2.9.1.1.2', 'cactiStatsDeviceIndex', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Column Data', 'read-only', '2', ''),
('.1.3.6.1.4.1.23925.2.9.1.2', 'cactiStatsDeviceHostname', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Fully qualified devicename or IP address.'),
('.1.3.6.1.4.1.23925.2.9.1.2.1', 'cactiStatsDeviceHostname', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', 'localhost', ''),
('.1.3.6.1.4.1.23925.2.9.1.2.2', 'cactiStatsDeviceHostname', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '10.1.1.12', ''),
('.1.3.6.1.4.1.23925.2.9.1.3', 'cactiStatsDeviceMinTime', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Minimum response time in seconds.'),
('.1.3.6.1.4.1.23925.2.9.1.3.1', 'cactiStatsDeviceMinTime', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '9.99999', ''),
('.1.3.6.1.4.1.23925.2.9.1.3.2', 'cactiStatsDeviceMinTime', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '9.99999', ''),
('.1.3.6.1.4.1.23925.2.9.1.4', 'cactiStatsDeviceMaxTime', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Maximum response time in seconds.'),
('.1.3.6.1.4.1.23925.2.9.1.4.1', 'cactiStatsDeviceMaxTime', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '0.00000', ''),
('.1.3.6.1.4.1.23925.2.9.1.4.2', 'cactiStatsDeviceMaxTime', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '0.00000', ''),
('.1.3.6.1.4.1.23925.2.9.1.5', 'cactiStatsDeviceCurTime', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Last response time in seconds.'),
('.1.3.6.1.4.1.23925.2.9.1.5.1', 'cactiStatsDeviceCurTime', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '0.00000', ''),
('.1.3.6.1.4.1.23925.2.9.1.5.2', 'cactiStatsDeviceCurTime', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '0.00000', ''),
('.1.3.6.1.4.1.23925.2.9.1.6', 'cactiStatsDeviceAvgTime', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Average response time in seconds.'),
('.1.3.6.1.4.1.23925.2.9.1.6.1', 'cactiStatsDeviceAvgTime', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '0.00000', ''),
('.1.3.6.1.4.1.23925.2.9.1.6.2', 'cactiStatsDeviceAvgTime', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '0.00000', ''),
('.1.3.6.1.4.1.23925.2.9.1.7', 'cactiStatsDeviceTotalPolls', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Number of total polls against a monitored device.'),
('.1.3.6.1.4.1.23925.2.9.1.7.1', 'cactiStatsDeviceTotalPolls', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Column Data', 'read-only', '0', ''),
('.1.3.6.1.4.1.23925.2.9.1.7.2', 'cactiStatsDeviceTotalPolls', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Column Data', 'read-only', '0', ''),
('.1.3.6.1.4.1.23925.2.9.1.8', 'cactiStatsDeviceFailedPolls', 'CACTI-MIB', 'Unsigned32', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Number of failed polls.'),
('.1.3.6.1.4.1.23925.2.9.1.8.1', 'cactiStatsDeviceFailedPolls', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Column Data', 'read-only', '0', ''),
('.1.3.6.1.4.1.23925.2.9.1.8.2', 'cactiStatsDeviceFailedPolls', 'CACTI-MIB', 'Unsigned32', 'DATA', 'Column Data', 'read-only', '0', ''),
('.1.3.6.1.4.1.23925.2.9.1.9', 'cactiStatsDeviceAvailability', 'CACTI-MIB', 'DisplayString', 'OBJECT-TYPE', 'Column', 'read-only', '', 'Calculated availablity in percent.'),
('.1.3.6.1.4.1.23925.2.9.1.9.1', 'cactiStatsDeviceAvailability', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '100.00000', ''),
('.1.3.6.1.4.1.23925.2.9.1.9.2', 'cactiStatsDeviceAvailability', 'CACTI-MIB', 'DisplayString', 'DATA', 'Column Data', 'read-only', '100.00000', ''),
('.1.3.6.1.4.1.23925.3', 'cactiEvents', 'CACTI-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'reserved for cacti events'),
('.1.3.6.1.4.1.23925.3.1', 'cactiEventAttributes', 'CACTI-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'resevered for event attributes, used as varbind for the SMNP notifications'),
('.1.3.6.1.4.1.23925.3.1.1.0', 'cactiEventDescription', 'CACTI-MIB', 'DisplayString', 'DATA', 'Scalar', 'accessible-for-notify', '', 'Contains a customized event description.'),
('.1.3.6.1.4.1.23925.3.2', 'cactiEventNotifications', 'CACTI-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'resevered for event notifications'),
('.1.3.6.1.4.1.23925.3.2.1', 'cactiNotify', 'CACTI-MIB', '', 'NOTIFICATION-TYPE', 'Notification', 'not-accessible', '', 'This SNMP notification will only include varbind cactiEventDescription<br>and can be used as a simple and generic notification by plugins for example.'),
('.1.3.6.1.4.1.23925.3.2.2', 'cactiNotifyDeviceDown', 'CACTI-MIB', '', 'NOTIFICATION-TYPE', 'Notification', 'not-accessible', '', 'This SNMP notification will be send to notification receivers if Cacti has detected<br>that a monitored device went down.'),
('.1.3.6.1.4.1.23925.3.2.3', 'cactiNotifyDeviceRecovering', 'CACTI-MIB', '', 'NOTIFICATION-TYPE', 'Notification', 'not-accessible', '', 'This SNMP notification will be send to notification receivers if Cacti has detected<br>that a monitored device became reachable again.'),
('.1.3.6.1.4.1.23925.3.2.4', 'cactiNotifyPollerRuntimeExceeding', 'CACTI-MIB', '', 'NOTIFICATION-TYPE', 'Notification', 'not-accessible', '', 'This SNMP notification will be send to notification receivers if a Cacti poller<br>has breached its maximum runtime.'),
('.1.3.6.1.4.1.23925.3.2.5', 'cactiNotifyDeviceFailedPoll', 'CACTI-MIB', '', 'NOTIFICATION-TYPE', 'Notification', 'not-accessible', '', 'This SNMP notification will be send to notification receivers if Cacti<br>was unable to poll a device.'),
('.1.3.6.1.4.1.23925.4', 'cactiPlugins', 'CACTI-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'cactiPlugins provides a root object identifier<br>from which mibs produced by plugin developers may be<br>placed. mibs written by other developers will typically<br>be implemented with the object identifiers as defined<br>in the mib.<br>Plugin developers have to take notice of the following<br>requirements:<br><br>|MIB name: CACTI-<plugin_name>-MIB<br>|Module name: <plugin_name><br>|Architecture:<br>Plugin mibs have to reserve the first three<br>sub-trees for:<br>+<br>|-<plugin_name>Appl(1)<br>|-<plugin_name>Stats(2)<br>|-<plugin_name>Events(3)<br>|-<plugin_name>MibGroups(4)<br><br>The plugin name has to be written in lower cases only.<br><br>As reference plugin developers should take a look at<br>the CACTI-THOLD-MIB.'),
('.1.3.6.1.4.1.23925.4.2', 'boost', 'CACTI-BOOST-MIB', '', 'MODULE-IDENTITY', 'Node', 'not-accessible', '', 'Initial version of this MIB module.'),
('.1.3.6.1.4.1.23925.4.2.1', 'boostAppl', 'CACTI-BOOST-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'reserved for Boost application data'),
('.1.3.6.1.4.1.23925.4.2.1.1.0', 'boostApplLastUpdate', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '1530171406', 'Unix timestamp when this data has been updated for the last time.'),
('.1.3.6.1.4.1.23925.4.2.1.10.0', 'boostApplServerEnabled', 'CACTI-BOOST-MIB', 'TruthValue', 'DATA', 'Scalar', 'read-only', '', 'If Boost Server will be used for RRDUpdates this object is set<br>to true (1).'),
('.1.3.6.1.4.1.23925.4.2.1.11.0', 'boostApplServerMultiprocess', 'CACTI-BOOST-MIB', 'TruthValue', 'DATA', 'Scalar', 'read-only', '', 'This object returns true (1) if Boost Server should  fork a separate<br>update process for each boost request'),
('.1.3.6.1.4.1.23925.4.2.1.12.0', 'boostApplServerHostname', 'CACTI-BOOST-MIB', 'DisplayString', 'DATA', 'Scalar', 'read-only', '', 'Returns the Hostname/IP of the boost server.'),
('.1.3.6.1.4.1.23925.4.2.1.13.0', 'boostApplServerListenPort', 'CACTI-BOOST-MIB', 'DisplayString', 'DATA', 'Scalar', 'read-only', '', 'Returns the TCP port the boost server will listen on.'),
('.1.3.6.1.4.1.23925.4.2.1.14.0', 'boostApplServerTimeOuts', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Defines the maximum number of seconds a client should wait on the<br>Boost server before giving up.'),
('.1.3.6.1.4.1.23925.4.2.1.15.0', 'boostApplImageCacheEnabled', 'CACTI-BOOST-MIB', 'TruthValue', 'DATA', 'Scalar', 'read-only', '2', 'If image caching has been enabled this object is set to true (1).'),
('.1.3.6.1.4.1.23925.4.2.1.16.0', 'boostApplLoggingEnabled', 'CACTI-BOOST-MIB', 'TruthValue', 'DATA', 'Scalar', 'read-only', '2', 'If Boost debug logging is enabled this object will return true (1).'),
('.1.3.6.1.4.1.23925.4.2.1.17.0', 'boostApplStorageDatabaseEngine', 'CACTI-BOOST-MIB', 'DisplayString', 'DATA', 'Scalar', 'read-only', '', 'Returns the database engine being used for the boost storage.'),
('.1.3.6.1.4.1.23925.4.2.1.18.0', 'boostApplStorageMaxTableSize', 'CACTI-BOOST-MIB', 'Integer32', 'DATA', 'Scalar', 'read-only', '', 'This object contains the maximum size in kbytes a boost memory (1) table<br>is allowed to have. If boostApplStorageDatabaseEngine is set to<br>myisam (2) the table size is unlimited and this object returns -1.'),
('.1.3.6.1.4.1.23925.4.2.1.19.0', 'boostApplStorageMaxRecords', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'This object contains the estimated number of records a boost memory (1)<br>table can store. If boostApplStorageDatabaseEngine is set to<br>myisam (2) the number of maximum records is unlimited and<br>this object returns 0.'),
('.1.3.6.1.4.1.23925.4.2.1.2.0', 'boostApplRrdUpdateEnabled', 'CACTI-BOOST-MIB', 'TruthValue', 'DATA', 'Scalar', 'read-only', '2', 'If Boost on demand RRD updating has been enabled this object is set<br>to true(1).'),
('.1.3.6.1.4.1.23925.4.2.1.3.0', 'boostApplRrdUpdateInterval', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '60', 'If Boost has been enabled this interval determines when<br>RRDfiles will be updated automatically.'),
('.1.3.6.1.4.1.23925.4.2.1.4.0', 'boostApplRrdUpdateMaxRecords', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '1000000', 'Represents the maximum size in records of the Boost output table.<br>If the boost output table exceeds this size, in records, an update<br>will take place.'),
('.1.3.6.1.4.1.23925.4.2.1.5.0', 'boostApplRrdUpdateMaxRecordsPerSelect', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '50000', 'Defines the maximum number of data source items that should be<br>retrieved in one single pass.'),
('.1.3.6.1.4.1.23925.4.2.1.6.0', 'boostApplRrdUpdateMaxStringLength', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '2000', 'Defines the maximum argument length Boost must not exceed for update<br>commands to RRDtool. This limit varies by operating system and kernel<br>level.'),
('.1.3.6.1.4.1.23925.4.2.1.7.0', 'boostApplRrdUpdatePollerMemLimit', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '1024', 'Returns the maximum amount of memory for the Cacti Poller and<br>Boost\'s Poller.'),
('.1.3.6.1.4.1.23925.4.2.1.8.0', 'boostApplRrdUpdateMaxRunTime', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '1200', 'Represents the maximum boot poller run time in seconds being allowed.'),
('.1.3.6.1.4.1.23925.4.2.1.9.0', 'boostApplRrdUpdateRedirect', 'CACTI-BOOST-MIB', 'TruthValue', 'DATA', 'Scalar', 'read-only', '2', 'If direct population of poller_output_boost table by spine has been<br>enabled this object is set to true(1). This enables direct insert of<br>records into poller output boost.'),
('.1.3.6.1.4.1.23925.4.2.2', 'boostStats', 'CACTI-BOOST-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'reserved for boost statistics'),
('.1.3.6.1.4.1.23925.4.2.2.1.0', 'boostStatsLastUpdate', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Unix timestamp when this data has been updated for the last time.'),
('.1.3.6.1.4.1.23925.4.2.2.10.0', 'boostStatsTotalsRecords', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Returns the total number of records being handled by Boost.'),
('.1.3.6.1.4.1.23925.4.2.2.11.0', 'boostStatsTotalsRecordsPending', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Total number of records marked as pending.'),
('.1.3.6.1.4.1.23925.4.2.2.12.0', 'boostStatsTotalsRecordsArchived', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Total number of records marked as archived.'),
('.1.3.6.1.4.1.23925.4.2.2.13.0', 'boostStatsStorageTableSize', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'This object contains the current size of the boost memory table<br>in kBytes.'),
('.1.3.6.1.4.1.23925.4.2.2.14.0', 'boostStatsStorageAverageRecordSize', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Returns the average record size of the boost memory table in bytes.'),
('.1.3.6.1.4.1.23925.4.2.2.15.0', 'boostStatsStorageMaxRecordLength', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Returns size of longest record within the boost memory table<br>in bytes.'),
('.1.3.6.1.4.1.23925.4.2.2.16.0', 'boostStatsTotalsImagesCacheSize', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Represents the total number of RRD image files being<br>currently cached by Boost.'),
('.1.3.6.1.4.1.23925.4.2.2.17.0', 'boostStatsTotalsImagesCacheReads', 'CACTI-BOOST-MIB', 'Counter64', 'DATA', 'Scalar', 'read-only', '', 'Number of succesful read operations.'),
('.1.3.6.1.4.1.23925.4.2.2.18.0', 'boostStatsTotalsImagesCacheWrites', 'CACTI-BOOST-MIB', 'Counter64', 'DATA', 'Scalar', 'read-only', '', 'Indicates the number of uncached read operations.'),
('.1.3.6.1.4.1.23925.4.2.2.2.0', 'boostStatsRrdUpdateProcessStatus', 'CACTI-BOOST-MIB', 'INTEGER', 'DATA', 'Scalar', 'read-only', '', 'The status the update process of Boost can have:<br>disabled(0)    - RRD update process has been disabled.<br>neverrun(1)    - RRD update process is enabled but did not run so far<br>complete(2)    - Last RRD update process has been completed<br>running(3)     - RRD update process is still running<br>overrun(4)     - Overrun detected ?     *review*<br>timeout(5)     - Time out detected ?    *review*<br>other(6)       - Undefined state        *review*'),
('.1.3.6.1.4.1.23925.4.2.2.3.0', 'boostStatsRrdUpdateLastRun', 'CACTI-BOOST-MIB', 'DisplayString', 'DATA', 'Scalar', 'read-only', '', 'Date of last run'),
('.1.3.6.1.4.1.23925.4.2.2.4.0', 'boostStatsRrdUpdates', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Number of RRDs being updated.'),
('.1.3.6.1.4.1.23925.4.2.2.5.0', 'boostStatsRrdUpdateDuration', 'CACTI-BOOST-MIB', 'DisplayString', 'DATA', 'Scalar', 'read-only', '', 'Represents the duration of the last update process in seconds.'),
('.1.3.6.1.4.1.23925.4.2.2.6.0', 'boostStatsRrdUpdateUtilization', 'CACTI-BOOST-MIB', 'DisplayString', 'DATA', 'Scalar', 'read-only', '', 'The proportion of the maximum upate frequency in percent Boost requires<br>to update all rrds.'),
('.1.3.6.1.4.1.23925.4.2.2.7.0', 'boostStatsRrdUpdatePollerPeakMemory', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Returns the peak of memory in bytes that has been allocated by Boost<br>during the last rrd update process.'),
('.1.3.6.1.4.1.23925.4.2.2.8.0', 'boostStatsRrdUpdateNextRun', 'CACTI-BOOST-MIB', 'DisplayString', 'DATA', 'Scalar', 'read-only', '', 'Date of next run'),
('.1.3.6.1.4.1.23925.4.2.2.9.0', 'boostStatsTotalsDataSources', 'CACTI-BOOST-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Represents the total number of poller items Boost has to take care of.'),
('.1.3.6.1.4.1.23925.4.2.3', 'boostEvents', 'CACTI-BOOST-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'reserved for boost events'),
('.1.3.6.1.4.1.23925.4.2.4', 'boostMibGroups', 'CACTI-BOOST-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'reserved for group definitions'),
('.1.3.6.1.4.1.23925.4.4', 'snmpagent', 'CACTI-SNMPAGENT-MIB', '', 'MODULE-IDENTITY', 'Node', 'not-accessible', '', 'Initial version of this MIB module.'),
('.1.3.6.1.4.1.23925.4.4.1', 'snmpagentAppl', 'CACTI-SNMPAGENT-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'resevered for statistics'),
('.1.3.6.1.4.1.23925.4.4.1.1.0', 'snmpagentApplLastUpdate', 'CACTI-SNMPAGENT-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Unix timestamp when this data has been updated for the last time.'),
('.1.3.6.1.4.1.23925.4.4.2', 'snmpagentStats', 'CACTI-SNMPAGENT-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'resevered for statistics'),
('.1.3.6.1.4.1.23925.4.4.2.1.0', 'snmpagentStatsLastUpdate', 'CACTI-SNMPAGENT-MIB', 'Unsigned32', 'DATA', 'Scalar', 'read-only', '', 'Unix timestamp when this data has been updated for the last time.'),
('.1.3.6.1.4.1.23925.4.4.3', 'snmpagentEvents', 'CACTI-SNMPAGENT-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'resevered for events'),
('.1.3.6.1.4.1.23925.4.4.3.1', 'snmpagentEventAttributes', 'CACTI-SNMPAGENT-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'resevered for event attributes, used as varbind for the SMNP notifications'),
('.1.3.6.1.4.1.23925.4.4.3.1.1.0', 'snmpagentEventDescription', 'CACTI-SNMPAGENT-MIB', 'DisplayString', 'DATA', 'Scalar', 'accessible-for-notify', '', 'Contains a customized event description.'),
('.1.3.6.1.4.1.23925.4.4.3.2', 'snmpagentEventNotifications', 'CACTI-SNMPAGENT-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'resevered for event notifications'),
('.1.3.6.1.4.1.23925.4.4.3.2.1', 'snmpagentNotificationTest', 'CACTI-SNMPAGENT-MIB', '', 'NOTIFICATION-TYPE', 'Notification', 'not-accessible', '', 'This SNMP notification will only include varbind snmpagentEventDescription<br>and can be used to verify the configuration of SNMP managers.'),
('.1.3.6.1.4.1.23925.4.4.4', 'snmpagentMibGroups', 'CACTI-SNMPAGENT-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'resevered for group definitions'),
('.1.3.6.1.4.1.23925.4.4.4.1', 'snmpagentEventGroup', 'CACTI-SNMPAGENT-MIB', '', 'OBJECT-GROUP', 'Group', 'not-accessible', '', 'A collection of objects providing the SNMPAgent event<br>attributes.'),
('.1.3.6.1.4.1.23925.4.4.4.2', 'snmpagentNotifyGroup', 'CACTI-SNMPAGENT-MIB', '', 'NOTIFICATION-GROUP', 'Group', 'not-accessible', '', 'The group of notifications SNMPAgent offers.'),
('.1.3.6.1.4.1.23925.5', 'cactiMibGroups', 'CACTI-MIB', '', 'OBJECT-IDENTITY', 'Node', 'not-accessible', '', 'reserved for group definitions'),
('.1.3.6.1.4.1.23925.5.1', 'cactiApplPollerGroup', 'CACTI-MIB', '', 'OBJECT-GROUP', 'Group', 'not-accessible', '', 'A collection of poller settings.'),
('.1.3.6.1.4.1.23925.5.2', 'cactiApplSpineGroup', 'CACTI-MIB', '', 'OBJECT-GROUP', 'Group', 'not-accessible', '', 'A collection of Spine specific parameters.'),
('.1.3.6.1.4.1.23925.5.3', 'cactiStatsTotalsDeviceGroup', 'CACTI-MIB', '', 'OBJECT-GROUP', 'Group', 'not-accessible', '', 'A collection of Spine specific parameters.'),
('.1.3.6.1.4.1.23925.5.4', 'cactiNotifyGroup', 'CACTI-MIB', '', 'NOTIFICATION-GROUP', 'Group', 'not-accessible', '', 'The group of notifications Cacti supports.');

-- --------------------------------------------------------

--
-- Table structure for table `snmpagent_cache_notifications`
--

CREATE TABLE `snmpagent_cache_notifications` (
  `name` varchar(191) NOT NULL,
  `mib` varchar(255) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `sequence_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Notifcations and related attributes';

--
-- Dumping data for table `snmpagent_cache_notifications`
--

INSERT INTO `snmpagent_cache_notifications` (`name`, `mib`, `attribute`, `sequence_id`) VALUES
('cactiNotify', 'CACTI-MIB', 'cactiEventDescription', 0),
('cactiNotifyDeviceDown', 'CACTI-MIB', 'cactiApplDeviceIndex', 0),
('cactiNotifyDeviceDown', 'CACTI-MIB', 'cactiApplDeviceDescription', 2),
('cactiNotifyDeviceDown', 'CACTI-MIB', 'cactiApplDeviceHostname', 4),
('cactiNotifyDeviceDown', 'CACTI-MIB', 'cactiApplDeviceLastError', 6),
('cactiNotifyDeviceRecovering', 'CACTI-MIB', 'cactiApplDeviceIndex', 0),
('cactiNotifyDeviceRecovering', 'CACTI-MIB', 'cactiApplDeviceDescription', 2),
('cactiNotifyDeviceRecovering', 'CACTI-MIB', 'cactiApplDeviceHostname', 4),
('cactiNotifyDeviceRecovering', 'CACTI-MIB', 'cactiApplDeviceLastError', 6),
('cactiNotifyPollerRuntimeExceeding', 'CACTI-MIB', 'cactiApplPollerIndex', 0),
('cactiNotifyPollerRuntimeExceeding', 'CACTI-MIB', 'cactiApplPollerHostname', 2),
('cactiNotifyPollerRuntimeExceeding', 'CACTI-MIB', 'cactiApplPollerIpAddress', 4),
('cactiNotifyDeviceFailedPoll', 'CACTI-MIB', 'cactiApplDeviceIndex', 0),
('cactiNotifyDeviceFailedPoll', 'CACTI-MIB', 'cactiApplDeviceDescription', 2),
('cactiNotifyDeviceFailedPoll', 'CACTI-MIB', 'cactiApplDeviceHostname', 4),
('cactiNotifyDeviceFailedPoll', 'CACTI-MIB', 'cactiApplDeviceLastError', 6),
('snmpagentNotificationTest', 'CACTI-SNMPAGENT-MIB', 'snmpagentEventDescription', 0);

-- --------------------------------------------------------

--
-- Table structure for table `snmpagent_cache_textual_conventions`
--

CREATE TABLE `snmpagent_cache_textual_conventions` (
  `name` varchar(191) NOT NULL,
  `mib` varchar(191) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(5000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Textual conventions';

--
-- Dumping data for table `snmpagent_cache_textual_conventions`
--

INSERT INTO `snmpagent_cache_textual_conventions` (`name`, `mib`, `type`, `description`) VALUES
('TcCactiApplSnmpVersion', 'CACTI-MIB', 'INTEGER', 'The type of SNMP being used:<br />\r\n<br />\r\nNET-SNMP<br />\r\nUCD-SNMP<br />\r\nPHP-SNMP<br />\r\n'),
('TcCactiApplPollerType', 'CACTI-MIB', 'INTEGER', 'Poller types:<br />\r\n<br />\r\ncmd         - php based poller<br />\r\nspine       - high performance C-based polling engine<br />\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `snmpagent_managers`
--

CREATE TABLE `snmpagent_managers` (
  `id` int(8) NOT NULL,
  `hostname` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `disabled` char(2) DEFAULT NULL,
  `max_log_size` tinyint(1) NOT NULL,
  `snmp_version` varchar(255) NOT NULL,
  `snmp_community` varchar(255) NOT NULL,
  `snmp_username` varchar(255) NOT NULL,
  `snmp_auth_password` varchar(255) NOT NULL,
  `snmp_auth_protocol` varchar(255) NOT NULL,
  `snmp_priv_password` varchar(255) NOT NULL,
  `snmp_priv_protocol` varchar(255) NOT NULL,
  `snmp_engine_id` varchar(64) NOT NULL DEFAULT '80005d750302FFFFFFFFFF',
  `snmp_port` varchar(255) NOT NULL,
  `snmp_message_type` tinyint(1) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='snmp notification receivers';

-- --------------------------------------------------------

--
-- Table structure for table `snmpagent_managers_notifications`
--

CREATE TABLE `snmpagent_managers_notifications` (
  `manager_id` int(8) NOT NULL,
  `notification` varchar(190) NOT NULL,
  `mib` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='snmp notifications to receivers';

-- --------------------------------------------------------

--
-- Table structure for table `snmpagent_mibs`
--

CREATE TABLE `snmpagent_mibs` (
  `id` int(8) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Registered MIB files';

--
-- Dumping data for table `snmpagent_mibs`
--

INSERT INTO `snmpagent_mibs` (`id`, `name`, `file`) VALUES
(1, 'CACTI-MIB', '/var/www/html/cacti/mibs/CACTI-MIB'),
(2, 'CACTI-SNMPAGENT-MIB', '/var/www/html/cacti/mibs/CACTI-SNMPAGENT-MIB'),
(3, 'CACTI-BOOST-MIB', '/var/www/html/cacti/mibs/CACTI-BOOST-MIB');

-- --------------------------------------------------------

--
-- Table structure for table `snmpagent_notifications_log`
--

CREATE TABLE `snmpagent_notifications_log` (
  `id` int(12) NOT NULL,
  `time` int(24) NOT NULL,
  `severity` tinyint(1) NOT NULL,
  `manager_id` int(8) NOT NULL,
  `notification` varchar(190) NOT NULL,
  `mib` varchar(191) NOT NULL,
  `varbinds` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='logs snmp notifications to receivers';

-- --------------------------------------------------------

--
-- Table structure for table `snmp_query`
--

CREATE TABLE `snmp_query` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `xml_path` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `graph_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `data_input_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `snmp_query`
--

INSERT INTO `snmp_query` (`id`, `hash`, `xml_path`, `name`, `description`, `graph_template_id`, `data_input_id`) VALUES
(1, '8ffa36c1864124b38bcda2ae9bd61f46', '<path_cacti>/resource/script_queries/unix_disk.xml', 'Unix - Get Mounted Partitions', 'Queries a list of mounted partitions on a unix-based host with the', 0, 11);

-- --------------------------------------------------------

--
-- Table structure for table `snmp_query_graph`
--

CREATE TABLE `snmp_query_graph` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `snmp_query_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `graph_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `snmp_query_graph`
--

INSERT INTO `snmp_query_graph` (`id`, `hash`, `snmp_query_id`, `name`, `graph_template_id`) VALUES
(1, 'a0b3e7b63c2e66f9e1ea24a16ff245fc', 1, 'Available Disk Space', 5);

-- --------------------------------------------------------

--
-- Table structure for table `snmp_query_graph_rrd`
--

CREATE TABLE `snmp_query_graph_rrd` (
  `snmp_query_graph_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `data_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `data_template_rrd_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `snmp_field_name` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `snmp_query_graph_rrd`
--

INSERT INTO `snmp_query_graph_rrd` (`snmp_query_graph_id`, `data_template_id`, `data_template_rrd_id`, `snmp_field_name`) VALUES
(1, 6, 8, 'dskUsed'),
(1, 6, 9, 'dskAvailable');

-- --------------------------------------------------------

--
-- Table structure for table `snmp_query_graph_rrd_sv`
--

CREATE TABLE `snmp_query_graph_rrd_sv` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `snmp_query_graph_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `data_template_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `snmp_query_graph_rrd_sv`
--

INSERT INTO `snmp_query_graph_rrd_sv` (`id`, `hash`, `snmp_query_graph_id`, `data_template_id`, `sequence`, `field_name`, `text`) VALUES
(1, 'cb09784ba05e401a3f1450126ed1e395', 1, 6, 1, 'name', '|host_description| - Free Space - |query_dskDevice|');

-- --------------------------------------------------------

--
-- Table structure for table `snmp_query_graph_sv`
--

CREATE TABLE `snmp_query_graph_sv` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `snmp_query_graph_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `snmp_query_graph_sv`
--

INSERT INTO `snmp_query_graph_sv` (`id`, `hash`, `snmp_query_graph_id`, `sequence`, `field_name`, `text`) VALUES
(1, 'f21b23df740bc4a2d691d2d7b1b18dba', 1, 1, 'title', '|host_description| - Disk Space - |query_dskDevice|');

-- --------------------------------------------------------

--
-- Table structure for table `syslog`
--

CREATE TABLE `syslog` (
  `facility_id` int(10) UNSIGNED DEFAULT NULL,
  `priority_id` int(10) UNSIGNED DEFAULT NULL,
  `program_id` int(10) UNSIGNED DEFAULT NULL,
  `host_id` int(10) UNSIGNED DEFAULT NULL,
  `logtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message` varchar(1024) NOT NULL DEFAULT '',
  `seq` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syslog_alert`
--

CREATE TABLE `syslog_alert` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `severity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `method` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `num` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `type` varchar(16) NOT NULL DEFAULT '',
  `enabled` char(2) DEFAULT 'on',
  `repeat_alert` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `open_ticket` char(2) DEFAULT '',
  `message` varchar(128) NOT NULL DEFAULT '',
  `user` varchar(32) NOT NULL DEFAULT '',
  `date` int(16) NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `command` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syslog_facilities`
--

CREATE TABLE `syslog_facilities` (
  `facility_id` int(10) UNSIGNED NOT NULL,
  `facility` varchar(10) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `syslog_facilities`
--

INSERT INTO `syslog_facilities` (`facility_id`, `facility`, `last_updated`) VALUES
(0, 'kern', '2018-06-27 15:48:06'),
(1, 'user', '2018-06-27 15:48:06'),
(2, 'mail', '2018-06-27 15:48:06'),
(3, 'daemon', '2018-06-27 15:48:06'),
(4, 'auth', '2018-06-27 15:48:06'),
(5, 'syslog', '2018-06-27 15:48:06'),
(6, 'lpd', '2018-06-27 15:48:06'),
(7, 'news', '2018-06-27 15:48:06'),
(8, 'uucp', '2018-06-27 15:48:06'),
(9, 'crond', '2018-06-27 15:48:06'),
(10, 'authpriv', '2018-06-27 15:48:06'),
(11, 'ftpd', '2018-06-27 15:48:06'),
(12, 'ntpd', '2018-06-27 15:48:06'),
(13, 'logaudit', '2018-06-27 15:48:06'),
(14, 'logalert', '2018-06-27 15:48:06'),
(15, 'crond', '2018-06-27 15:48:06'),
(16, 'local0', '2018-06-27 15:48:06'),
(17, 'local1', '2018-06-27 15:48:06'),
(18, 'local2', '2018-06-27 15:48:06'),
(19, 'local3', '2018-06-27 15:48:06'),
(20, 'local4', '2018-06-27 15:48:06'),
(21, 'local5', '2018-06-27 15:48:06'),
(22, 'local6', '2018-06-27 15:48:06'),
(23, 'local7', '2018-06-27 15:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `syslog_hosts`
--

CREATE TABLE `syslog_hosts` (
  `host_id` int(10) UNSIGNED NOT NULL,
  `host` varchar(64) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Contains all hosts currently in the syslog table';

-- --------------------------------------------------------

--
-- Table structure for table `syslog_host_facilities`
--

CREATE TABLE `syslog_host_facilities` (
  `host_id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syslog_incoming`
--

CREATE TABLE `syslog_incoming` (
  `facility_id` int(10) UNSIGNED DEFAULT NULL,
  `priority_id` int(10) UNSIGNED DEFAULT NULL,
  `program` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `host` varchar(64) DEFAULT NULL,
  `message` varchar(1024) NOT NULL DEFAULT '',
  `seq` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syslog_logs`
--

CREATE TABLE `syslog_logs` (
  `alert_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `logseq` bigint(20) UNSIGNED NOT NULL,
  `logtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logmsg` varchar(1024) DEFAULT NULL,
  `host` varchar(64) DEFAULT NULL,
  `facility_id` int(10) UNSIGNED DEFAULT NULL,
  `priority_id` int(10) UNSIGNED DEFAULT NULL,
  `program_id` int(10) UNSIGNED DEFAULT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `html` blob,
  `seq` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syslog_priorities`
--

CREATE TABLE `syslog_priorities` (
  `priority_id` int(10) UNSIGNED NOT NULL,
  `priority` varchar(10) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `syslog_priorities`
--

INSERT INTO `syslog_priorities` (`priority_id`, `priority`, `last_updated`) VALUES
(0, 'emerg', '2018-06-27 15:48:06'),
(1, 'alert', '2018-06-27 15:48:06'),
(2, 'crit', '2018-06-27 15:48:06'),
(3, 'err', '2018-06-27 15:48:06'),
(4, 'warning', '2018-06-27 15:48:06'),
(5, 'notice', '2018-06-27 15:48:06'),
(6, 'info', '2018-06-27 15:48:06'),
(7, 'debug', '2018-06-27 15:48:06'),
(8, 'other', '2018-06-27 15:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `syslog_programs`
--

CREATE TABLE `syslog_programs` (
  `program_id` int(10) UNSIGNED NOT NULL,
  `program` varchar(40) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Contains all programs currently in the syslog table';

-- --------------------------------------------------------

--
-- Table structure for table `syslog_remove`
--

CREATE TABLE `syslog_remove` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(16) NOT NULL DEFAULT '',
  `enabled` char(2) DEFAULT 'on',
  `method` char(5) DEFAULT 'del',
  `message` varchar(128) NOT NULL DEFAULT '',
  `user` varchar(32) NOT NULL DEFAULT '',
  `date` int(16) NOT NULL DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syslog_removed`
--

CREATE TABLE `syslog_removed` (
  `facility_id` int(10) UNSIGNED DEFAULT NULL,
  `priority_id` int(10) UNSIGNED DEFAULT NULL,
  `program_id` int(10) UNSIGNED DEFAULT NULL,
  `host_id` int(10) UNSIGNED DEFAULT NULL,
  `logtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message` varchar(1024) NOT NULL DEFAULT '',
  `seq` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syslog_reports`
--

CREATE TABLE `syslog_reports` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(16) NOT NULL DEFAULT '',
  `enabled` char(2) DEFAULT 'on',
  `timespan` int(16) NOT NULL DEFAULT '0',
  `timepart` char(5) NOT NULL DEFAULT '00:00',
  `lastsent` int(16) NOT NULL DEFAULT '0',
  `body` varchar(1024) DEFAULT NULL,
  `message` varchar(128) DEFAULT NULL,
  `user` varchar(32) NOT NULL DEFAULT '',
  `date` int(16) NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syslog_statistics`
--

CREATE TABLE `syslog_statistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `host_id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `priority_id` int(10) UNSIGNED NOT NULL,
  `program_id` int(10) UNSIGNED DEFAULT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `records` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Maintains High Level Statistics';

-- --------------------------------------------------------

--
-- Table structure for table `user_auth`
--

CREATE TABLE `user_auth` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(2048) NOT NULL DEFAULT '',
  `realm` mediumint(8) NOT NULL DEFAULT '0',
  `full_name` varchar(100) DEFAULT '0',
  `email_address` varchar(128) DEFAULT NULL,
  `must_change_password` char(2) DEFAULT NULL,
  `password_change` char(2) DEFAULT 'on',
  `show_tree` char(2) DEFAULT 'on',
  `show_list` char(2) DEFAULT 'on',
  `show_preview` char(2) NOT NULL DEFAULT 'on',
  `graph_settings` char(2) DEFAULT NULL,
  `login_opts` tinyint(1) NOT NULL DEFAULT '1',
  `policy_graphs` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `policy_trees` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `policy_hosts` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `policy_graph_templates` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `enabled` char(2) NOT NULL DEFAULT 'on',
  `lastchange` int(12) NOT NULL DEFAULT '-1',
  `lastlogin` int(12) NOT NULL DEFAULT '-1',
  `password_history` varchar(4096) NOT NULL DEFAULT '-1',
  `locked` varchar(3) NOT NULL DEFAULT '',
  `failed_attempts` int(5) NOT NULL DEFAULT '0',
  `lastfail` int(12) NOT NULL DEFAULT '0',
  `reset_perms` int(12) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_auth`
--

INSERT INTO `user_auth` (`id`, `username`, `password`, `realm`, `full_name`, `email_address`, `must_change_password`, `password_change`, `show_tree`, `show_list`, `show_preview`, `graph_settings`, `login_opts`, `policy_graphs`, `policy_trees`, `policy_hosts`, `policy_graph_templates`, `enabled`, `lastchange`, `lastlogin`, `password_history`, `locked`, `failed_attempts`, `lastfail`, `reset_perms`) VALUES
(1, 'admin', '$2y$10$G8XAcS8qs2DmeTNpp70Z5.vCUltGmrTqmJmT5x88nrL9UEvFAjs6u', 0, 'Administrator', '', '', 'on', 'on', 'on', 'on', 'on', 2, 1, 1, 1, 1, 'on', -1, -1, '-1', '', 0, 0, 0),
(3, 'guest', '43e9a4ab75570f5b', 0, 'Guest Account', '', 'on', 'on', 'on', 'on', 'on', '3', 1, 1, 1, 1, 1, '', -1, -1, '-1', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_auth_cache`
--

CREATE TABLE `user_auth_cache` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(191) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Caches Remember Me Details';

-- --------------------------------------------------------

--
-- Table structure for table `user_auth_group`
--

CREATE TABLE `user_auth_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `graph_settings` varchar(2) DEFAULT NULL,
  `login_opts` tinyint(1) NOT NULL DEFAULT '1',
  `show_tree` varchar(2) DEFAULT 'on',
  `show_list` varchar(2) DEFAULT 'on',
  `show_preview` varchar(2) NOT NULL DEFAULT 'on',
  `policy_graphs` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `policy_trees` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `policy_hosts` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `policy_graph_templates` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `enabled` char(2) NOT NULL DEFAULT 'on'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table that Contains User Groups';

-- --------------------------------------------------------

--
-- Table structure for table `user_auth_group_members`
--

CREATE TABLE `user_auth_group_members` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table that Contains User Group Members';

-- --------------------------------------------------------

--
-- Table structure for table `user_auth_group_perms`
--

CREATE TABLE `user_auth_group_perms` (
  `group_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `item_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table that Contains User Group Permissions';

-- --------------------------------------------------------

--
-- Table structure for table `user_auth_group_realm`
--

CREATE TABLE `user_auth_group_realm` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `realm_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table that Contains User Group Realm Permissions';

-- --------------------------------------------------------

--
-- Table structure for table `user_auth_perms`
--

CREATE TABLE `user_auth_perms` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `item_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_auth_realm`
--

CREATE TABLE `user_auth_realm` (
  `realm_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_auth_realm`
--

INSERT INTO `user_auth_realm` (`realm_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(101, 1),
(102, 1),
(103, 1),
(7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_domains`
--

CREATE TABLE `user_domains` (
  `domain_id` int(10) UNSIGNED NOT NULL,
  `domain_name` varchar(20) NOT NULL,
  `type` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `enabled` char(2) NOT NULL DEFAULT 'on',
  `defdomain` tinyint(3) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to Hold Login Domains';

-- --------------------------------------------------------

--
-- Table structure for table `user_domains_ldap`
--

CREATE TABLE `user_domains_ldap` (
  `domain_id` int(10) UNSIGNED NOT NULL,
  `server` varchar(128) NOT NULL,
  `port` int(10) UNSIGNED NOT NULL,
  `port_ssl` int(10) UNSIGNED NOT NULL,
  `proto_version` tinyint(3) UNSIGNED NOT NULL,
  `encryption` tinyint(3) UNSIGNED NOT NULL,
  `referrals` tinyint(3) UNSIGNED NOT NULL,
  `mode` tinyint(3) UNSIGNED NOT NULL,
  `dn` varchar(128) NOT NULL,
  `group_require` char(2) NOT NULL,
  `group_dn` varchar(128) NOT NULL,
  `group_attrib` varchar(128) NOT NULL,
  `group_member_type` tinyint(3) UNSIGNED NOT NULL,
  `search_base` varchar(128) NOT NULL,
  `search_filter` varchar(128) NOT NULL,
  `specific_dn` varchar(128) NOT NULL,
  `specific_password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to Hold Login Domains for LDAP';

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `username` varchar(50) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `result` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`username`, `user_id`, `time`, `result`, `ip`) VALUES
('admin', 0, '2018-06-27 12:18:35', 3, '145.37.120.170'),
('admin', 0, '2018-06-27 15:37:01', 0, '31.161.157.28'),
('admin', 1, '2018-06-27 12:18:06', 1, '145.37.120.170'),
('admin', 1, '2018-06-27 12:19:06', 1, '145.37.120.170'),
('admin', 1, '2018-06-27 15:37:06', 1, '31.161.157.28'),
('admin', 1, '2018-06-27 16:39:38', 1, '31.161.157.28'),
('admin', 1, '2018-06-28 06:12:19', 1, '31.161.157.28');

-- --------------------------------------------------------

--
-- Table structure for table `vdef`
--

CREATE TABLE `vdef` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='vdef';

--
-- Dumping data for table `vdef`
--

INSERT INTO `vdef` (`id`, `hash`, `name`) VALUES
(1, 'e06ed529238448773038601afb3cf278', 'Maximum'),
(2, 'e4872dda82092393d6459c831a50dc3b', 'Minimum'),
(3, '5ce1061a46bb62f36840c80412d2e629', 'Average'),
(4, '06bd3cbe802da6a0745ea5ba93af554a', 'Last (Current)'),
(5, '631c1b9086f3979d6dcf5c7a6946f104', 'First'),
(6, '6b5335843630b66f858ce6b7c61fc493', 'Total: Current Data Source'),
(7, 'c80d12b0f030af3574da68b28826cd39', '95th Percentage: Current Data Source');

-- --------------------------------------------------------

--
-- Table structure for table `vdef_items`
--

CREATE TABLE `vdef_items` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `vdef_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='vdef items';

--
-- Dumping data for table `vdef_items`
--

INSERT INTO `vdef_items` (`id`, `hash`, `vdef_id`, `sequence`, `type`, `value`) VALUES
(1, '88d33bf9271ac2bdf490cf1784a342c1', 1, 1, 4, 'CURRENT_DATA_SOURCE'),
(2, 'a307afab0c9b1779580039e3f7c4f6e5', 1, 2, 1, '1'),
(3, '0945a96068bb57c80bfbd726cf1afa02', 2, 1, 4, 'CURRENT_DATA_SOURCE'),
(4, '95a8df2eac60a89e8a8ca3ea3d019c44', 2, 2, 1, '2'),
(5, 'cc2e1c47ec0b4f02eb13708cf6dac585', 3, 1, 4, 'CURRENT_DATA_SOURCE'),
(6, 'a2fd796335b87d9ba54af6a855689507', 3, 2, 1, '3'),
(7, 'a1d7974ee6018083a2053e0d0f7cb901', 4, 1, 4, 'CURRENT_DATA_SOURCE'),
(8, '26fccba1c215439616bc1b83637ae7f3', 4, 2, 1, '5'),
(9, 'a8993b265f4c5398f4a47c44b5b37a07', 5, 1, 4, 'CURRENT_DATA_SOURCE'),
(10, '5a380d469d611719057c3695ce1e4eee', 5, 2, 1, '6'),
(11, '65cfe546b17175fad41fcca98c057feb', 6, 1, 4, 'CURRENT_DATA_SOURCE'),
(12, 'f330b5633c3517d7c62762cef091cc9e', 6, 2, 1, '7'),
(13, 'f1bf2ecf54ca0565cf39c9c3f7e5394b', 7, 1, 4, 'CURRENT_DATA_SOURCE'),
(14, '11a26f18feba3919be3af426670cba95', 7, 2, 6, '95'),
(15, 'e7ae90275bc1efada07c19ca3472d9db', 7, 3, 1, '8');

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `cacti` char(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`cacti`) VALUES
('1.1.18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aggregate_graphs`
--
ALTER TABLE `aggregate_graphs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aggregate_template_id` (`aggregate_template_id`),
  ADD KEY `local_graph_id` (`local_graph_id`),
  ADD KEY `title_format` (`title_format`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `aggregate_graphs_graph_item`
--
ALTER TABLE `aggregate_graphs_graph_item`
  ADD PRIMARY KEY (`aggregate_graph_id`,`graph_templates_item_id`);

--
-- Indexes for table `aggregate_graphs_items`
--
ALTER TABLE `aggregate_graphs_items`
  ADD PRIMARY KEY (`aggregate_graph_id`,`local_graph_id`);

--
-- Indexes for table `aggregate_graph_templates`
--
ALTER TABLE `aggregate_graph_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `graph_template_id` (`graph_template_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `aggregate_graph_templates_graph`
--
ALTER TABLE `aggregate_graph_templates_graph`
  ADD PRIMARY KEY (`aggregate_template_id`);

--
-- Indexes for table `aggregate_graph_templates_item`
--
ALTER TABLE `aggregate_graph_templates_item`
  ADD PRIMARY KEY (`aggregate_template_id`,`graph_templates_item_id`);

--
-- Indexes for table `automation_devices`
--
ALTER TABLE `automation_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip` (`ip`),
  ADD KEY `hostname` (`hostname`);

--
-- Indexes for table `automation_graph_rules`
--
ALTER TABLE `automation_graph_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(171));

--
-- Indexes for table `automation_graph_rule_items`
--
ALTER TABLE `automation_graph_rule_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automation_ips`
--
ALTER TABLE `automation_ips`
  ADD PRIMARY KEY (`ip_address`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `automation_match_rule_items`
--
ALTER TABLE `automation_match_rule_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automation_networks`
--
ALTER TABLE `automation_networks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poller_id` (`poller_id`);

--
-- Indexes for table `automation_processes`
--
ALTER TABLE `automation_processes`
  ADD PRIMARY KEY (`pid`,`network_id`);

--
-- Indexes for table `automation_snmp`
--
ALTER TABLE `automation_snmp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automation_snmp_items`
--
ALTER TABLE `automation_snmp_items`
  ADD PRIMARY KEY (`id`,`snmp_id`);

--
-- Indexes for table `automation_templates`
--
ALTER TABLE `automation_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automation_tree_rules`
--
ALTER TABLE `automation_tree_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(171));

--
-- Indexes for table `automation_tree_rule_items`
--
ALTER TABLE `automation_tree_rule_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdef`
--
ALTER TABLE `cdef`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `name` (`name`(171));

--
-- Indexes for table `cdef_items`
--
ALTER TABLE `cdef_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cdef_id_sequence` (`cdef_id`,`sequence`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hex` (`hex`);

--
-- Indexes for table `color_templates`
--
ALTER TABLE `color_templates`
  ADD PRIMARY KEY (`color_template_id`);

--
-- Indexes for table `color_template_items`
--
ALTER TABLE `color_template_items`
  ADD PRIMARY KEY (`color_template_item_id`);

--
-- Indexes for table `data_input`
--
ALTER TABLE `data_input`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name_type_id` (`name`(171),`type_id`);

--
-- Indexes for table `data_input_data`
--
ALTER TABLE `data_input_data`
  ADD PRIMARY KEY (`data_input_field_id`,`data_template_data_id`),
  ADD KEY `t_value` (`t_value`);

--
-- Indexes for table `data_input_fields`
--
ALTER TABLE `data_input_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_input_id` (`data_input_id`),
  ADD KEY `type_code_data_input_id` (`type_code`,`data_input_id`);

--
-- Indexes for table `data_local`
--
ALTER TABLE `data_local`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_template_id` (`data_template_id`),
  ADD KEY `snmp_query_id` (`snmp_query_id`),
  ADD KEY `snmp_index` (`snmp_index`(191)),
  ADD KEY `host_id_snmp_query_id` (`host_id`,`snmp_query_id`);

--
-- Indexes for table `data_source_profiles`
--
ALTER TABLE `data_source_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(171));

--
-- Indexes for table `data_source_profiles_cf`
--
ALTER TABLE `data_source_profiles_cf`
  ADD PRIMARY KEY (`data_source_profile_id`,`consolidation_function_id`),
  ADD KEY `data_source_profile_id` (`data_source_profile_id`);

--
-- Indexes for table `data_source_profiles_rra`
--
ALTER TABLE `data_source_profiles_rra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_source_profile_id` (`data_source_profile_id`);

--
-- Indexes for table `data_source_purge_action`
--
ALTER TABLE `data_source_purge_action`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `data_source_purge_temp`
--
ALTER TABLE `data_source_purge_temp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `local_data_id` (`local_data_id`),
  ADD KEY `in_cacti` (`in_cacti`),
  ADD KEY `data_template_id` (`data_template_id`);

--
-- Indexes for table `data_source_stats_daily`
--
ALTER TABLE `data_source_stats_daily`
  ADD PRIMARY KEY (`local_data_id`,`rrd_name`);

--
-- Indexes for table `data_source_stats_hourly`
--
ALTER TABLE `data_source_stats_hourly`
  ADD PRIMARY KEY (`local_data_id`,`rrd_name`);

--
-- Indexes for table `data_source_stats_hourly_cache`
--
ALTER TABLE `data_source_stats_hourly_cache`
  ADD PRIMARY KEY (`local_data_id`,`time`,`rrd_name`),
  ADD KEY `time` (`time`) USING BTREE;

--
-- Indexes for table `data_source_stats_hourly_last`
--
ALTER TABLE `data_source_stats_hourly_last`
  ADD PRIMARY KEY (`local_data_id`,`rrd_name`);

--
-- Indexes for table `data_source_stats_monthly`
--
ALTER TABLE `data_source_stats_monthly`
  ADD PRIMARY KEY (`local_data_id`,`rrd_name`);

--
-- Indexes for table `data_source_stats_weekly`
--
ALTER TABLE `data_source_stats_weekly`
  ADD PRIMARY KEY (`local_data_id`,`rrd_name`);

--
-- Indexes for table `data_source_stats_yearly`
--
ALTER TABLE `data_source_stats_yearly`
  ADD PRIMARY KEY (`local_data_id`,`rrd_name`);

--
-- Indexes for table `data_template`
--
ALTER TABLE `data_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `data_template_data`
--
ALTER TABLE `data_template_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `local_data_id` (`local_data_id`),
  ADD KEY `data_template_id` (`data_template_id`),
  ADD KEY `data_input_id` (`data_input_id`);

--
-- Indexes for table `data_template_rrd`
--
ALTER TABLE `data_template_rrd`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `duplicate_dsname_contraint` (`local_data_id`,`data_source_name`,`data_template_id`),
  ADD KEY `local_data_id` (`local_data_id`),
  ADD KEY `data_template_id` (`data_template_id`),
  ADD KEY `local_data_template_rrd_id` (`local_data_template_rrd_id`);

--
-- Indexes for table `external_links`
--
ALTER TABLE `external_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `graph_local`
--
ALTER TABLE `graph_local`
  ADD PRIMARY KEY (`id`),
  ADD KEY `host_id` (`host_id`),
  ADD KEY `graph_template_id` (`graph_template_id`),
  ADD KEY `snmp_query_id` (`snmp_query_id`),
  ADD KEY `snmp_query_graph_id` (`snmp_query_graph_id`),
  ADD KEY `snmp_index` (`snmp_index`(191));

--
-- Indexes for table `graph_templates`
--
ALTER TABLE `graph_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `multiple_name` (`multiple`,`name`(171)),
  ADD KEY `name` (`name`(171));

--
-- Indexes for table `graph_templates_gprint`
--
ALTER TABLE `graph_templates_gprint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `graph_templates_graph`
--
ALTER TABLE `graph_templates_graph`
  ADD PRIMARY KEY (`id`),
  ADD KEY `local_graph_id` (`local_graph_id`),
  ADD KEY `graph_template_id` (`graph_template_id`),
  ADD KEY `title_cache` (`title_cache`(191));

--
-- Indexes for table `graph_templates_item`
--
ALTER TABLE `graph_templates_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `graph_template_id` (`graph_template_id`),
  ADD KEY `local_graph_id_sequence` (`local_graph_id`,`sequence`),
  ADD KEY `task_item_id` (`task_item_id`),
  ADD KEY `lgi_gti` (`local_graph_id`,`graph_template_id`);

--
-- Indexes for table `graph_template_input`
--
ALTER TABLE `graph_template_input`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `graph_template_input_defs`
--
ALTER TABLE `graph_template_input_defs`
  ADD PRIMARY KEY (`graph_template_input_id`,`graph_template_item_id`),
  ADD KEY `graph_template_input_id` (`graph_template_input_id`);

--
-- Indexes for table `graph_tree`
--
ALTER TABLE `graph_tree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sequence` (`sequence`),
  ADD KEY `name` (`name`(171));

--
-- Indexes for table `graph_tree_items`
--
ALTER TABLE `graph_tree_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `graph_tree_id` (`graph_tree_id`),
  ADD KEY `host_id` (`host_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `local_graph_id` (`local_graph_id`),
  ADD KEY `parent_position` (`parent`,`position`);

--
-- Indexes for table `host`
--
ALTER TABLE `host`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poller_id` (`poller_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `external_id` (`external_id`),
  ADD KEY `disabled` (`disabled`);

--
-- Indexes for table `host_graph`
--
ALTER TABLE `host_graph`
  ADD PRIMARY KEY (`host_id`,`graph_template_id`);

--
-- Indexes for table `host_snmp_cache`
--
ALTER TABLE `host_snmp_cache`
  ADD PRIMARY KEY (`host_id`,`snmp_query_id`,`field_name`,`snmp_index`),
  ADD KEY `host_id` (`host_id`,`field_name`),
  ADD KEY `snmp_index` (`snmp_index`),
  ADD KEY `field_name` (`field_name`),
  ADD KEY `field_value` (`field_value`(191)),
  ADD KEY `snmp_query_id` (`snmp_query_id`),
  ADD KEY `present` (`present`);

--
-- Indexes for table `host_snmp_query`
--
ALTER TABLE `host_snmp_query`
  ADD PRIMARY KEY (`host_id`,`snmp_query_id`),
  ADD KEY `host_id` (`host_id`);

--
-- Indexes for table `host_template`
--
ALTER TABLE `host_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `host_template_graph`
--
ALTER TABLE `host_template_graph`
  ADD PRIMARY KEY (`host_template_id`,`graph_template_id`),
  ADD KEY `host_template_id` (`host_template_id`);

--
-- Indexes for table `host_template_snmp_query`
--
ALTER TABLE `host_template_snmp_query`
  ADD PRIMARY KEY (`host_template_id`,`snmp_query_id`),
  ADD KEY `host_template_id` (`host_template_id`);

--
-- Indexes for table `plugin_config`
--
ALTER TABLE `plugin_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `directory` (`directory`);

--
-- Indexes for table `plugin_db_changes`
--
ALTER TABLE `plugin_db_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plugin` (`plugin`),
  ADD KEY `method` (`method`);

--
-- Indexes for table `plugin_hooks`
--
ALTER TABLE `plugin_hooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `plugin_realms`
--
ALTER TABLE `plugin_realms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plugin` (`plugin`);

--
-- Indexes for table `poller`
--
ALTER TABLE `poller`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `poller_command`
--
ALTER TABLE `poller_command`
  ADD PRIMARY KEY (`poller_id`,`action`,`command`);

--
-- Indexes for table `poller_data_template_field_mappings`
--
ALTER TABLE `poller_data_template_field_mappings`
  ADD PRIMARY KEY (`data_template_id`,`data_name`,`data_source_names`);

--
-- Indexes for table `poller_item`
--
ALTER TABLE `poller_item`
  ADD PRIMARY KEY (`local_data_id`,`rrd_name`),
  ADD KEY `local_data_id` (`local_data_id`),
  ADD KEY `host_id` (`host_id`),
  ADD KEY `rrd_next_step` (`rrd_next_step`),
  ADD KEY `action` (`action`),
  ADD KEY `present` (`present`),
  ADD KEY `poller_id_host_id` (`poller_id`,`host_id`);

--
-- Indexes for table `poller_output`
--
ALTER TABLE `poller_output`
  ADD PRIMARY KEY (`local_data_id`,`rrd_name`,`time`) USING BTREE;

--
-- Indexes for table `poller_output_boost`
--
ALTER TABLE `poller_output_boost`
  ADD PRIMARY KEY (`local_data_id`,`time`,`rrd_name`) USING BTREE;

--
-- Indexes for table `poller_output_boost_processes`
--
ALTER TABLE `poller_output_boost_processes`
  ADD PRIMARY KEY (`sock_int_value`);

--
-- Indexes for table `poller_output_realtime`
--
ALTER TABLE `poller_output_realtime`
  ADD PRIMARY KEY (`local_data_id`,`rrd_name`,`time`),
  ADD KEY `poller_id` (`poller_id`(191));

--
-- Indexes for table `poller_reindex`
--
ALTER TABLE `poller_reindex`
  ADD PRIMARY KEY (`host_id`,`data_query_id`),
  ADD KEY `present` (`present`);

--
-- Indexes for table `poller_resource_cache`
--
ALTER TABLE `poller_resource_cache`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`);

--
-- Indexes for table `poller_time`
--
ALTER TABLE `poller_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mailtime` (`mailtime`);

--
-- Indexes for table `reports_items`
--
ALTER TABLE `reports_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `settings_tree`
--
ALTER TABLE `settings_tree`
  ADD PRIMARY KEY (`user_id`,`graph_tree_item_id`);

--
-- Indexes for table `settings_user`
--
ALTER TABLE `settings_user`
  ADD PRIMARY KEY (`user_id`,`name`);

--
-- Indexes for table `settings_user_group`
--
ALTER TABLE `settings_user_group`
  ADD PRIMARY KEY (`group_id`,`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `city` (`city`),
  ADD KEY `state` (`state`),
  ADD KEY `postal_code` (`postal_code`),
  ADD KEY `country` (`country`),
  ADD KEY `alternate_id` (`alternate_id`);

--
-- Indexes for table `snmpagent_cache`
--
ALTER TABLE `snmpagent_cache`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `name` (`name`),
  ADD KEY `mib_name` (`mib`,`name`);

--
-- Indexes for table `snmpagent_cache_notifications`
--
ALTER TABLE `snmpagent_cache_notifications`
  ADD KEY `name` (`name`);

--
-- Indexes for table `snmpagent_cache_textual_conventions`
--
ALTER TABLE `snmpagent_cache_textual_conventions`
  ADD KEY `name` (`name`),
  ADD KEY `mib` (`mib`);

--
-- Indexes for table `snmpagent_managers`
--
ALTER TABLE `snmpagent_managers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostname` (`hostname`);

--
-- Indexes for table `snmpagent_managers_notifications`
--
ALTER TABLE `snmpagent_managers_notifications`
  ADD KEY `mib` (`mib`),
  ADD KEY `manager_id_notification` (`manager_id`,`notification`);

--
-- Indexes for table `snmpagent_mibs`
--
ALTER TABLE `snmpagent_mibs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `snmpagent_notifications_log`
--
ALTER TABLE `snmpagent_notifications_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `severity` (`severity`),
  ADD KEY `manager_id_notification` (`manager_id`,`notification`);

--
-- Indexes for table `snmp_query`
--
ALTER TABLE `snmp_query`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `snmp_query_graph`
--
ALTER TABLE `snmp_query_graph`
  ADD PRIMARY KEY (`id`),
  ADD KEY `graph_template_id_name` (`graph_template_id`,`name`),
  ADD KEY `snmp_query_id_name` (`snmp_query_id`,`name`);

--
-- Indexes for table `snmp_query_graph_rrd`
--
ALTER TABLE `snmp_query_graph_rrd`
  ADD PRIMARY KEY (`snmp_query_graph_id`,`data_template_id`,`data_template_rrd_id`),
  ADD KEY `data_template_rrd_id` (`data_template_rrd_id`),
  ADD KEY `snmp_query_graph_id` (`snmp_query_graph_id`);

--
-- Indexes for table `snmp_query_graph_rrd_sv`
--
ALTER TABLE `snmp_query_graph_rrd_sv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `snmp_query_graph_id` (`snmp_query_graph_id`),
  ADD KEY `data_template_id` (`data_template_id`);

--
-- Indexes for table `snmp_query_graph_sv`
--
ALTER TABLE `snmp_query_graph_sv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `snmp_query_graph_id` (`snmp_query_graph_id`);

--
-- Indexes for table `syslog`
--
ALTER TABLE `syslog`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `logtime` (`logtime`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `host_id` (`host_id`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `facility_id` (`facility_id`);

--
-- Indexes for table `syslog_alert`
--
ALTER TABLE `syslog_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `syslog_facilities`
--
ALTER TABLE `syslog_facilities`
  ADD PRIMARY KEY (`facility_id`),
  ADD KEY `last_updated` (`last_updated`);

--
-- Indexes for table `syslog_hosts`
--
ALTER TABLE `syslog_hosts`
  ADD PRIMARY KEY (`host`),
  ADD KEY `host_id` (`host_id`),
  ADD KEY `last_updated` (`last_updated`);

--
-- Indexes for table `syslog_host_facilities`
--
ALTER TABLE `syslog_host_facilities`
  ADD PRIMARY KEY (`host_id`,`facility_id`);

--
-- Indexes for table `syslog_incoming`
--
ALTER TABLE `syslog_incoming`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `program` (`program`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `syslog_logs`
--
ALTER TABLE `syslog_logs`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `logseq` (`logseq`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `alert_id` (`alert_id`),
  ADD KEY `host` (`host`),
  ADD KEY `seq` (`seq`),
  ADD KEY `logtime` (`logtime`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `facility_id` (`facility_id`);

--
-- Indexes for table `syslog_priorities`
--
ALTER TABLE `syslog_priorities`
  ADD PRIMARY KEY (`priority_id`),
  ADD KEY `last_updated` (`last_updated`);

--
-- Indexes for table `syslog_programs`
--
ALTER TABLE `syslog_programs`
  ADD PRIMARY KEY (`program`),
  ADD KEY `host_id` (`program_id`),
  ADD KEY `last_updated` (`last_updated`);

--
-- Indexes for table `syslog_remove`
--
ALTER TABLE `syslog_remove`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `syslog_removed`
--
ALTER TABLE `syslog_removed`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `logtime` (`logtime`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `host_id` (`host_id`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `facility_id` (`facility_id`);

--
-- Indexes for table `syslog_reports`
--
ALTER TABLE `syslog_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `syslog_statistics`
--
ALTER TABLE `syslog_statistics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_pk` (`host_id`,`facility_id`,`priority_id`,`program_id`,`insert_time`),
  ADD KEY `host_id` (`host_id`),
  ADD KEY `facility_id` (`facility_id`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `insert_time` (`insert_time`);

--
-- Indexes for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `realm` (`realm`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `user_auth_cache`
--
ALTER TABLE `user_auth_cache`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokenkey` (`token`),
  ADD KEY `hostname` (`hostname`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_auth_group`
--
ALTER TABLE `user_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_auth_group_members`
--
ALTER TABLE `user_auth_group_members`
  ADD PRIMARY KEY (`group_id`,`user_id`),
  ADD KEY `realm_id` (`user_id`);

--
-- Indexes for table `user_auth_group_perms`
--
ALTER TABLE `user_auth_group_perms`
  ADD PRIMARY KEY (`group_id`,`item_id`,`type`),
  ADD KEY `group_id` (`group_id`,`type`);

--
-- Indexes for table `user_auth_group_realm`
--
ALTER TABLE `user_auth_group_realm`
  ADD PRIMARY KEY (`group_id`,`realm_id`),
  ADD KEY `realm_id` (`realm_id`);

--
-- Indexes for table `user_auth_perms`
--
ALTER TABLE `user_auth_perms`
  ADD PRIMARY KEY (`user_id`,`item_id`,`type`),
  ADD KEY `user_id` (`user_id`,`type`);

--
-- Indexes for table `user_auth_realm`
--
ALTER TABLE `user_auth_realm`
  ADD PRIMARY KEY (`realm_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_domains`
--
ALTER TABLE `user_domains`
  ADD PRIMARY KEY (`domain_id`);

--
-- Indexes for table `user_domains_ldap`
--
ALTER TABLE `user_domains_ldap`
  ADD PRIMARY KEY (`domain_id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`username`,`user_id`,`time`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `vdef`
--
ALTER TABLE `vdef`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `name` (`name`(171));

--
-- Indexes for table `vdef_items`
--
ALTER TABLE `vdef_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vdef_id_sequence` (`vdef_id`,`sequence`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`cacti`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aggregate_graphs`
--
ALTER TABLE `aggregate_graphs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aggregate_graph_templates`
--
ALTER TABLE `aggregate_graph_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `automation_devices`
--
ALTER TABLE `automation_devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `automation_graph_rules`
--
ALTER TABLE `automation_graph_rules`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `automation_graph_rule_items`
--
ALTER TABLE `automation_graph_rule_items`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `automation_match_rule_items`
--
ALTER TABLE `automation_match_rule_items`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `automation_networks`
--
ALTER TABLE `automation_networks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `automation_snmp`
--
ALTER TABLE `automation_snmp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `automation_snmp_items`
--
ALTER TABLE `automation_snmp_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `automation_templates`
--
ALTER TABLE `automation_templates`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `automation_tree_rules`
--
ALTER TABLE `automation_tree_rules`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `automation_tree_rule_items`
--
ALTER TABLE `automation_tree_rule_items`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cdef`
--
ALTER TABLE `cdef`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `cdef_items`
--
ALTER TABLE `cdef_items`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;
--
-- AUTO_INCREMENT for table `color_templates`
--
ALTER TABLE `color_templates`
  MODIFY `color_template_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `color_template_items`
--
ALTER TABLE `color_template_items`
  MODIFY `color_template_item_id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `data_input`
--
ALTER TABLE `data_input`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `data_input_fields`
--
ALTER TABLE `data_input_fields`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `data_local`
--
ALTER TABLE `data_local`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `data_source_profiles`
--
ALTER TABLE `data_source_profiles`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `data_source_profiles_rra`
--
ALTER TABLE `data_source_profiles_rra`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `data_source_purge_action`
--
ALTER TABLE `data_source_purge_action`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data_source_purge_temp`
--
ALTER TABLE `data_source_purge_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data_template`
--
ALTER TABLE `data_template`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `data_template_data`
--
ALTER TABLE `data_template_data`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `data_template_rrd`
--
ALTER TABLE `data_template_rrd`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `external_links`
--
ALTER TABLE `external_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `graph_local`
--
ALTER TABLE `graph_local`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `graph_templates`
--
ALTER TABLE `graph_templates`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `graph_templates_gprint`
--
ALTER TABLE `graph_templates_gprint`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `graph_templates_graph`
--
ALTER TABLE `graph_templates_graph`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `graph_templates_item`
--
ALTER TABLE `graph_templates_item`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT for table `graph_template_input`
--
ALTER TABLE `graph_template_input`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `graph_tree`
--
ALTER TABLE `graph_tree`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `graph_tree_items`
--
ALTER TABLE `graph_tree_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `host`
--
ALTER TABLE `host`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `host_template`
--
ALTER TABLE `host_template`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `plugin_config`
--
ALTER TABLE `plugin_config`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `plugin_db_changes`
--
ALTER TABLE `plugin_db_changes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `plugin_hooks`
--
ALTER TABLE `plugin_hooks`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `plugin_realms`
--
ALTER TABLE `plugin_realms`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `poller`
--
ALTER TABLE `poller`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `poller_output_boost_processes`
--
ALTER TABLE `poller_output_boost_processes`
  MODIFY `sock_int_value` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `poller_resource_cache`
--
ALTER TABLE `poller_resource_cache`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `poller_time`
--
ALTER TABLE `poller_time`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reports_items`
--
ALTER TABLE `reports_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `snmpagent_managers`
--
ALTER TABLE `snmpagent_managers`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `snmpagent_mibs`
--
ALTER TABLE `snmpagent_mibs`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `snmpagent_notifications_log`
--
ALTER TABLE `snmpagent_notifications_log`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `snmp_query`
--
ALTER TABLE `snmp_query`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `snmp_query_graph`
--
ALTER TABLE `snmp_query_graph`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `snmp_query_graph_rrd_sv`
--
ALTER TABLE `snmp_query_graph_rrd_sv`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `snmp_query_graph_sv`
--
ALTER TABLE `snmp_query_graph_sv`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `syslog`
--
ALTER TABLE `syslog`
  MODIFY `seq` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syslog_alert`
--
ALTER TABLE `syslog_alert`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syslog_hosts`
--
ALTER TABLE `syslog_hosts`
  MODIFY `host_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syslog_incoming`
--
ALTER TABLE `syslog_incoming`
  MODIFY `seq` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syslog_logs`
--
ALTER TABLE `syslog_logs`
  MODIFY `seq` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syslog_programs`
--
ALTER TABLE `syslog_programs`
  MODIFY `program_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syslog_remove`
--
ALTER TABLE `syslog_remove`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syslog_removed`
--
ALTER TABLE `syslog_removed`
  MODIFY `seq` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syslog_reports`
--
ALTER TABLE `syslog_reports`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syslog_statistics`
--
ALTER TABLE `syslog_statistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_auth`
--
ALTER TABLE `user_auth`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_auth_cache`
--
ALTER TABLE `user_auth_cache`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_auth_group`
--
ALTER TABLE `user_auth_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_domains`
--
ALTER TABLE `user_domains`
  MODIFY `domain_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vdef`
--
ALTER TABLE `vdef`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `vdef_items`
--
ALTER TABLE `vdef_items`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
