package views
{
   import §_-42B§.TweenMax;
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-8S§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-J2n§;
   import §_-Y22§.§_-E1J§;
   import §_-e1G§.§_-Hb§;
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
   import sounds.§_-43Z§;
   import utils.StringUtil;
   import utils.§_-N1w§;
   import utils.§_-ex§;
   
   public class §_-t1N§ extends Sprite
   {
      
      private static const §_-12n§:int = 15;
      
      private static const §_-M2S§:Array = [RatingIconNone,RatingBronzeAnimation,RatingSilverAnimation,RatingGoldAnimation,RatingMasterAnimation,RatingDiamondAnimation,RatingChampionAnimation];
      
      private static const §_-b23§:GlowFilter = new GlowFilter(16777215,1,4,4);
      
      private static const §_-g1C§:GlowFilter = new GlowFilter(16711680,1,3,3,16);
      
      private var §_-d1m§:MovieClip = null;
      
      private var §_-N28§:int = 0;
      
      private var §_-51x§:Boolean = false;
      
      private var §_-r1j§:§_-22V§ = null;
      
      private var §_-f2X§:DisplayObject = null;
      
      private var value:int = 0;
      
      private var §_-p10§:int = -1;
      
      private var §_-TE§:int = 1;
      
      private var type:int = 0;
      
      private var leagues:Array = [];
      
      private var league:int = -1;
      
      private var §_-XW§:§_-Hb§ = null;
      
      private var tween:TweenMax = null;
      
      public function §_-t1N§(param1:int = 0)
      {
         super();
         this.type = param1;
         this.init();
         §_-13r§.addEventListener(GameEvent.LEAGUE_CHANGED,this.§_-K2x§);
         §_-13r§.addEventListener(GameEvent.RATING_CHANGED,this.§_-Eb§);
         §_-13r§.addEventListener(GameEvent.PLACE_CHANGED,this.§_-kG§);
         §_-01Y§.§_-h1R§(this.§_-A1b§);
         §_-01Y§.§_-c9§(this.§_-6o§);
         addEventListener(MouseEvent.CLICK,this.§_-6c§);
         this.§_-K2x§();
         this.§_-Eb§();
      }
      
      private function init() : void
      {
         this.graphics.beginFill(11062527,0.35);
         this.graphics.lineStyle(1,7829367,0.15);
         this.graphics.drawRoundRect(0,0,82,20,5);
         this.§_-r1j§ = new §_-22V§("",20,2,new TextFormat(null,12,16777215,true,null,null,null,null,"center"));
         this.§_-r1j§.wordWrap = true;
         this.§_-r1j§.width = 50;
         addChild(this.§_-r1j§);
         this.§_-XW§ = new §_-Hb§(this,"",false,true);
      }
      
      private function §_-6c§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§,true);
         if(§_-71o§.active is §_-E1J§)
         {
            return;
         }
         §_-71o§.show(§_-J2n§.instance);
      }
      
      private function §_-Eb§(param1:GameEvent = null) : void
      {
         if(Boolean(param1) && param1.data["type"] != this.type)
         {
            return;
         }
         this.value = param1 ? int(param1.data["value"]) : §_-13r§.§_-4G§(this.type);
         this.§_-TE§ = Math.max(1,(this.value - this.§_-p10§) / 30);
      }
      
      private function §_-kG§(param1:GameEvent) : void
      {
         var e:GameEvent = param1;
         if(e.data["type"] != this.type)
         {
            return;
         }
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
         if(this.§_-f2X§)
         {
            removeChild(this.§_-f2X§);
         }
         this.§_-f2X§ = null;
         if(e.data["value"] == 0)
         {
            return;
         }
         this.§_-f2X§ = e.data["value"] > 0 ? new RatingUpIcon() : new RatingDownIcon();
         this.§_-f2X§.x = 69;
         this.§_-f2X§.y = 2;
         addChild(this.§_-f2X§);
         this.tween = TweenMax.to(this.§_-f2X§,0.4,{
            "y":(e.data["value"] > 0 ? 1 : 3),
            "repeat":3,
            "onRepeat":function():void
            {
               §_-f2X§.y = 2;
            },
            "onComplete":function():void
            {
               §_-f2X§.y = 2;
            }
         });
      }
      
      private function §_-K2x§(param1:GameEvent = null) : void
      {
         if(Boolean(param1) && param1.data["type"] != this.type)
         {
            return;
         }
         if(!this.§_-d1m§)
         {
            this.league = §_-13r§.§_-DX§(this.type);
            this.§_-d1m§ = new §_-M2S§[this.league]();
            this.§_-d1m§.gotoAndStop(this.§_-d1m§.totalFrames - 1);
            this.§_-d1m§.y = 10;
            this.§_-d1m§.filters = [§_-b23§];
            addChild(this.§_-d1m§);
         }
         else
         {
            this.leagues.push(§_-13r§.§_-DX§(this.type));
            if(!this.§_-51x§)
            {
               this.§_-H2q§();
            }
         }
      }
      
      private function §_-H2q§() : void
      {
         this.§_-N28§ = 0;
         this.§_-51x§ = true;
      }
      
      private function §_-A1b§() : void
      {
         if(!this.visible)
         {
            return;
         }
         this.§_-ko§();
         this.§_-V21§();
      }
      
      private function §_-6o§() : void
      {
         var _loc2_:int = 0;
         if(!this.visible)
         {
            return;
         }
         var _loc1_:String = "<b>" + gls("Рейтинг") + "\n</b>";
         if(this.league < §_-8S§.§_-Oh§(this.type) - 1)
         {
            _loc2_ = §_-13r§.§_-m1j§(this.type);
            if(_loc2_ > 0)
            {
               _loc1_ += gls("Лига:") + " <b>" + §_-8S§.§_-11s§(Math.max(0,this.league),this.type) + "</b><br>";
               _loc1_ += gls("До след. лиги:") + " <b> " + _loc2_ + " </b>" + StringUtil.word("очко",_loc2_) + "<br>";
            }
            else
            {
               _loc1_ += gls("Для попадания в лигу сыграй") + "<b> " + gls("один раунд") + "</b><br>";
            }
         }
         else
         {
            _loc1_ += gls("Лига:") + " <b>" + §_-8S§.§_-11s§(Math.max(0,this.league),this.type) + "</b><br>";
         }
         _loc1_ += gls("До конца сезона:") + " <b>" + §_-ex§.§_-d2X§(§_-13r§.§_-c1h§) + "</b>";
         this.§_-XW§.setStatus("<body>" + _loc1_ + "</body>");
      }
      
      private function §_-ko§() : void
      {
         if(this.value == this.§_-p10§)
         {
            return;
         }
         if(this.§_-p10§ == -1)
         {
            this.§_-p10§ = this.value;
         }
         this.§_-p10§ += Math.min(this.§_-TE§,this.value - this.§_-p10§);
         this.§_-r1j§.text = this.§_-p10§.toString();
      }
      
      private function §_-V21§() : void
      {
         if(!this.§_-51x§ || this.§_-N28§ >= §_-12n§)
         {
            return;
         }
         ++this.§_-N28§;
         var _loc1_:int = 255 * (this.§_-N28§ / §_-12n§);
         this.§_-d1m§.filters = [new ColorMatrixFilter([1,0,0,0,_loc1_,0,1,0,0,_loc1_,0,0,1,0,_loc1_,0,0,0,1,0])];
         if(this.§_-N28§ < §_-12n§)
         {
            return;
         }
         removeChild(this.§_-d1m§);
         this.league = this.leagues.shift();
         this.§_-d1m§ = new §_-M2S§[this.league]();
         this.§_-d1m§.addFrameScript(this.§_-d1m§.totalFrames - 1,this.§_-iT§);
         this.§_-d1m§.gotoAndPlay(0);
         this.§_-d1m§.y = 10;
         addChild(this.§_-d1m§);
      }
      
      private function §_-iT§() : void
      {
         this.§_-d1m§.stop();
         §_-N1w§.§_-s2c§(this.§_-d1m§);
         this.§_-d1m§.filters = [§_-b23§];
         if(this.leagues.length > 0)
         {
            this.§_-H2q§();
         }
         else
         {
            this.§_-51x§ = false;
         }
         var _loc1_:int = §_-13r§.§_-B2w§(this.type == §_-13r§.CLAN_TYPE ? int(Game.self["clan_id"]) : Game.selfId,this.type);
         if(_loc1_ != -1)
         {
            this.§_-d1m§.addChild(new §_-22V§(_loc1_.toString(),0,0,new TextFormat(null,10,16777215))).filters = [§_-g1C§];
         }
      }
   }
}

