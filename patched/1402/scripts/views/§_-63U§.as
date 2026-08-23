package views
{
   import §_-22D§.TweenMax;
   import §_-I2Y§.§_-91K§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-93H§;
   import §_-c2C§.§_-j2f§;
   import §_-c2C§.§_-t2c§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.StringUtil;
   import utils.§_-12w§;
   import utils.§_-B1d§;
   
   public class §_-63U§ extends Sprite
   {
      
      private static const §_-E1m§:int = 15;
      
      private static const §_-52U§:Array = [RatingIconNone,RatingBronzeAnimation,RatingSilverAnimation,RatingGoldAnimation,RatingMasterAnimation,RatingDiamondAnimation,RatingChampionAnimation];
      
      private static const §_-21n§:GlowFilter = new GlowFilter(16777215,1,4,4);
      
      private static const §_-93v§:GlowFilter = new GlowFilter(16711680,1,3,3,16);
      
      private var §_-p2v§:MovieClip = null;
      
      private var §_-F2d§:int = 0;
      
      private var §_-c25§:Boolean = false;
      
      private var §_-e9§:§_-i5§ = null;
      
      private var §_-22Q§:DisplayObject = null;
      
      private var value:int = 0;
      
      private var §_-23w§:int = -1;
      
      private var §_-T3§:int = 1;
      
      private var type:int = 0;
      
      private var leagues:Array = [];
      
      private var league:int = -1;
      
      private var §_-oj§:§_-kr§ = null;
      
      private var tween:TweenMax = null;
      
      public function §_-63U§(param1:int = 0)
      {
         super();
         this.type = param1;
         this.init();
         §_-82O§.addEventListener(GameEvent.LEAGUE_CHANGED,this.§_-G1C§);
         §_-82O§.addEventListener(GameEvent.RATING_CHANGED,this.§_-e2w§);
         §_-82O§.addEventListener(GameEvent.PLACE_CHANGED,this.§_-P2q§);
         §_-p1V§.§_-A3z§(this.§_-62z§);
         §_-p1V§.§_-63T§(this.§_-L1Y§);
         addEventListener(MouseEvent.CLICK,this.§_-v§);
         this.§_-G1C§();
         this.§_-e2w§();
      }
      
      private function init() : void
      {
         this.graphics.beginFill(11062527,0.35);
         this.graphics.lineStyle(1,7829367,0.15);
         this.graphics.drawRoundRect(0,0,82,20,5);
         this.§_-e9§ = new §_-i5§("",20,2,new TextFormat(null,12,16777215,true,null,null,null,null,"center"));
         this.§_-e9§.wordWrap = true;
         this.§_-e9§.width = 50;
         addChild(this.§_-e9§);
         this.§_-oj§ = new §_-kr§(this,"",false,true);
      }
      
      private function §_-v§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§,true);
         if(§_-t2c§.active is §_-91K§)
         {
            return;
         }
         §_-t2c§.show(§_-j2f§.instance);
      }
      
      private function §_-e2w§(param1:GameEvent = null) : void
      {
         if(Boolean(param1) && param1.data["type"] != this.type)
         {
            return;
         }
         this.value = param1 ? int(param1.data["value"]) : §_-82O§.§_-PK§(this.type);
         this.§_-T3§ = Math.max(1,(this.value - this.§_-23w§) / 30);
      }
      
      private function §_-P2q§(param1:GameEvent) : void
      {
         var e:GameEvent = param1;
         if(e.data["type"] != this.type)
         {
            return;
         }
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         if(this.§_-22Q§)
         {
            removeChild(this.§_-22Q§);
         }
         this.§_-22Q§ = null;
         if(e.data["value"] == 0)
         {
            return;
         }
         this.§_-22Q§ = e.data["value"] > 0 ? new RatingUpIcon() : new RatingDownIcon();
         this.§_-22Q§.x = 69;
         this.§_-22Q§.y = 2;
         addChild(this.§_-22Q§);
         this.tween = TweenMax.to(this.§_-22Q§,0.4,{
            "y":(e.data["value"] > 0 ? 1 : 3),
            "repeat":3,
            "onRepeat":function():void
            {
               §_-22Q§.y = 2;
            },
            "onComplete":function():void
            {
               §_-22Q§.y = 2;
            }
         });
      }
      
      private function §_-G1C§(param1:GameEvent = null) : void
      {
         if(Boolean(param1) && param1.data["type"] != this.type)
         {
            return;
         }
         if(!this.§_-p2v§)
         {
            this.league = §_-82O§.§_-a15§(this.type);
            this.§_-p2v§ = new §_-52U§[this.league]();
            this.§_-p2v§.gotoAndStop(this.§_-p2v§.totalFrames - 1);
            this.§_-p2v§.y = 10;
            this.§_-p2v§.filters = [§_-21n§];
            addChild(this.§_-p2v§);
         }
         else
         {
            this.leagues.push(§_-82O§.§_-a15§(this.type));
            if(!this.§_-c25§)
            {
               this.§_-l7§();
            }
         }
      }
      
      private function §_-l7§() : void
      {
         this.§_-F2d§ = 0;
         this.§_-c25§ = true;
      }
      
      private function §_-62z§() : void
      {
         if(!this.visible)
         {
            return;
         }
         this.§_-y2o§();
         this.§_-Z1x§();
      }
      
      private function §_-L1Y§() : void
      {
         var _loc2_:int = 0;
         if(!this.visible)
         {
            return;
         }
         var _loc1_:String = "<b>" + gls("Рейтинг") + "\n</b>";
         if(this.league < §_-93H§.§_-B39§(this.type) - 1)
         {
            _loc2_ = §_-82O§.§_-QA§(this.type);
            if(_loc2_ > 0)
            {
               _loc1_ += gls("Лига:") + " <b>" + §_-93H§.§_-XY§(Math.max(0,this.league),this.type) + "</b><br>";
               _loc1_ += gls("До след. лиги:") + " <b> " + _loc2_ + " </b>" + StringUtil.word("очко",_loc2_) + "<br>";
            }
            else
            {
               _loc1_ += gls("Для попадания в лигу сыграй") + "<b> " + gls("один раунд") + "</b><br>";
            }
         }
         else
         {
            _loc1_ += gls("Лига:") + " <b>" + §_-93H§.§_-XY§(Math.max(0,this.league),this.type) + "</b><br>";
         }
         _loc1_ += gls("До конца сезона:") + " <b>" + §_-B1d§.§_-g2n§(§_-82O§.§_-C1R§) + "</b>";
         this.§_-oj§.setStatus("<body>" + _loc1_ + "</body>");
      }
      
      private function §_-y2o§() : void
      {
         if(this.value == this.§_-23w§)
         {
            return;
         }
         if(this.§_-23w§ == -1)
         {
            this.§_-23w§ = this.value;
         }
         this.§_-23w§ += Math.min(this.§_-T3§,this.value - this.§_-23w§);
         this.§_-e9§.text = this.§_-23w§.toString();
      }
      
      private function §_-Z1x§() : void
      {
         if(!this.§_-c25§ || this.§_-F2d§ >= §_-E1m§)
         {
            return;
         }
         ++this.§_-F2d§;
         var _loc1_:int = 255 * (this.§_-F2d§ / §_-E1m§);
         this.§_-p2v§.filters = [new ColorMatrixFilter([1,0,0,0,_loc1_,0,1,0,0,_loc1_,0,0,1,0,_loc1_,0,0,0,1,0])];
         if(this.§_-F2d§ < §_-E1m§)
         {
            return;
         }
         removeChild(this.§_-p2v§);
         this.league = this.leagues.shift();
         this.§_-p2v§ = new §_-52U§[this.league]();
         this.§_-p2v§.addFrameScript(this.§_-p2v§.totalFrames - 1,this.§_-51q§);
         this.§_-p2v§.gotoAndPlay(0);
         this.§_-p2v§.y = 10;
         addChild(this.§_-p2v§);
      }
      
      private function §_-51q§() : void
      {
         this.§_-p2v§.stop();
         §_-12w§.§_-b1b§(this.§_-p2v§);
         this.§_-p2v§.filters = [§_-21n§];
         if(this.leagues.length > 0)
         {
            this.§_-l7§();
         }
         else
         {
            this.§_-c25§ = false;
         }
         var _loc1_:int = §_-82O§.§_-3S§(this.type == §_-82O§.CLAN_TYPE ? int(Game.self["clan_id"]) : Game.selfId,this.type);
         if(_loc1_ != -1)
         {
            this.§_-p2v§.addChild(new §_-i5§(_loc1_.toString(),0,0,new TextFormat(null,10,16777215))).filters = [§_-93v§];
         }
      }
   }
}

