package
{
   import §_-TK§.§_-aS§;
   import §_-X1k§.§_-82O§;
   import §_-c2C§.§_-u24§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import views.§_-j1o§;
   
   public class §_-01v§ extends §_-aS§
   {
      
      private static const §_-V1Z§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,14542830,false);
      
      private static const §_-916§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,9886972,true);
      
      private static const §_-MW§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,9886972,true);
      
      private static const §_-s1S§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,16515005,true);
      
      private static const §_-V2k§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,16731507,true);
      
      private static const §_-33c§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,16731507,true);
      
      private static const §_-RW§:TextFormat = new TextFormat(§_-i5§.§_-c10§,9,16768368,false);
      
      private static const §_-Ex§:DropShadowFilter = new DropShadowFilter(0,45,2900327,1,4,4,4);
      
      private static const §_-23p§:DropShadowFilter = new DropShadowFilter(0,45,2900327,1,3,3,1);
      
      private var playerId:int;
      
      private var §_-G5§:TextFormat = null;
      
      private var §_-33f§:Array = [];
      
      private var §_-R1b§:TextFormat = null;
      
      private var §_-i2h§:Array = [];
      
      private var §_-C1F§:Boolean = false;
      
      private var §_-93u§:Sprite = null;
      
      private var §_-31N§:int = Hero.§_-PM§;
      
      private var §_-xb§:DisplayObject = null;
      
      private var §_-62q§:§_-j1o§ = null;
      
      private var §_-kh§:§_-i5§ = null;
      
      private var §_-N2m§:§_-i5§ = null;
      
      private var §_-73v§:§_-i5§ = null;
      
      private var §_-f2m§:§_-aS§ = null;
      
      public function §_-01v§(param1:int)
      {
         super();
         this.playerId = param1;
         this.init();
         if(this.playerId == Game.selfId)
         {
            §_-82O§.addEventListener(GameEvent.LEAGUE_CHANGED,this.§_-g1A§);
         }
      }
      
      override public function scaleXY(param1:Number, param2:Number = 0) : void
      {
      }
      
      override public function set scaleX(param1:Number) : void
      {
      }
      
      override public function set scaleY(param1:Number) : void
      {
      }
      
      public function dispose() : void
      {
         if(this.§_-f2m§)
         {
            this.§_-f2m§.removeFromParent(true);
         }
         this.§_-f2m§ = null;
      }
      
      public function set team(param1:int) : void
      {
         if(this.§_-31N§ == param1)
         {
            return;
         }
         this.§_-31N§ = param1;
         if(this.playerId == Game.selfId)
         {
            return;
         }
         switch(this.§_-31N§)
         {
            case Hero.§_-i1Y§:
               this.§_-G5§ = §_-916§;
               this.§_-R1b§ = §_-MW§;
               this.§_-33f§ = [§_-Ex§];
               break;
            case Hero.§_-l1B§:
               this.§_-G5§ = §_-V2k§;
               this.§_-R1b§ = §_-33c§;
               this.§_-33f§ = [§_-Ex§];
               break;
            default:
               this.§_-G5§ = §_-V1Z§;
               this.§_-R1b§ = §_-MW§;
               this.§_-33f§ = [];
         }
         this.§_-91H§(this.§_-C1F§);
      }
      
      public function set shaman(param1:Boolean) : void
      {
         if(this.§_-C1F§ == param1)
         {
            return;
         }
         this.§_-C1F§ = param1;
         this.§_-91H§(this.§_-C1F§);
      }
      
      public function set §_-M1d§(param1:int) : void
      {
         this.§_-kh§.text = param1.toString();
      }
      
      public function set playerName(param1:String) : void
      {
         this.§_-N2m§.text = param1;
      }
      
      public function get §_-g1F§() : String
      {
         return this.§_-73v§.text;
      }
      
      public function set §_-g1F§(param1:String) : void
      {
         this.§_-73v§.text = param1;
      }
      
      public function set league(param1:int) : void
      {
         if(!this.§_-62q§)
         {
            this.§_-62q§ = new §_-j1o§(this.playerId,§_-82O§.PLAYER_TYPE,0.6,true,true);
            this.§_-62q§.y = 5;
            addChild(this.§_-62q§);
         }
         this.§_-62q§.league = param1;
      }
      
      public function set §_-mI§(param1:Boolean) : void
      {
         this.§_-xb§.visible = param1;
      }
      
      public function redraw() : void
      {
         this.graphics.clear();
         if(this.§_-N2m§.text == "")
         {
            return;
         }
         var _loc1_:int = Math.max(this.§_-N2m§.textWidth,this.§_-73v§.textWidth) + (this.§_-62q§.width > 0 || this.§_-xb§.visible ? 30 : 20);
         var _loc2_:int = this.§_-73v§.text == "" ? 20 : 30;
         this.§_-N2m§.x = int((_loc1_ - this.§_-N2m§.textWidth) * 0.5) - 2;
         this.§_-73v§.x = int((_loc1_ - this.§_-73v§.textWidth) * 0.5) - 1;
         this.graphics.beginFill(0,0);
         if(this.§_-C1F§)
         {
            this.graphics.beginFill(16777215,0.45);
         }
         if(this.playerId == Game.selfId)
         {
            this.graphics.beginFill(0,0.45);
         }
         this.graphics.drawRoundRect(0,0,_loc1_,_loc2_,10);
         this.graphics.endFill();
         this.§_-xb§.x = _loc1_ - 5;
         if(this.§_-f2m§)
         {
            this.§_-f2m§.removeFromParent(true);
         }
         this.§_-f2m§ = null;
         this.§_-63N§(_loc1_);
         this.§_-f2m§ = new §_-aS§(this,true);
         this.§_-f2m§.pivotX = 0;
         this.§_-f2m§.pivotY = -80 + _loc2_;
         this.§_-f2m§.x = -int(_loc1_ * 0.5);
         §_-J2J§(this.§_-f2m§);
      }
      
      private function init() : void
      {
         if(this.playerId == Game.selfId)
         {
            this.§_-G5§ = §_-s1S§;
            this.§_-33f§ = [§_-Ex§];
            this.§_-R1b§ = §_-s1S§;
            this.§_-i2h§ = [§_-Ex§];
         }
         else
         {
            this.§_-G5§ = §_-V1Z§;
            this.§_-33f§ = [§_-23p§];
            this.§_-R1b§ = §_-MW§;
            this.§_-i2h§ = [§_-Ex§];
         }
         this.§_-N2m§ = new §_-i5§("",0,0,this.§_-G5§);
         this.§_-N2m§.filters = this.§_-33f§;
         addChild(this.§_-N2m§);
         this.§_-73v§ = new §_-i5§("",0,15,§_-RW§);
         this.§_-73v§.filters = this.§_-33f§;
         addChild(this.§_-73v§);
         this.§_-kh§ = new §_-i5§("",0,0,new TextFormat(§_-i5§.§_-p1s§,15,76372));
         this.§_-xb§ = new ImageNameVIP();
         this.§_-xb§.y = -5;
         this.§_-xb§.visible = false;
         addChild(this.§_-xb§);
      }
      
      private function §_-91H§(param1:Boolean) : void
      {
         if(param1)
         {
            this.§_-N2m§.defaultTextFormat = this.§_-R1b§;
            this.§_-N2m§.setTextFormat(this.§_-R1b§);
            this.§_-N2m§.filters = this.§_-i2h§;
         }
         else
         {
            this.§_-N2m§.defaultTextFormat = this.§_-G5§;
            this.§_-N2m§.setTextFormat(this.§_-G5§);
            this.§_-N2m§.filters = this.§_-33f§;
         }
         this.redraw();
      }
      
      private function §_-63N§(param1:int) : void
      {
         if(this.§_-C1F§ && §_-u24§.mode != §_-at§.§_-F15§ && this.§_-kh§.text != "")
         {
            if(!this.§_-93u§)
            {
               this.§_-93u§ = new Sprite();
               this.§_-93u§.addChild(this.§_-31N§ == Hero.§_-l1B§ ? new ImageNameShamanRed() : new ImageNameShaman());
               this.§_-93u§.addChild(this.§_-kh§);
               this.§_-kh§.x = -int(this.§_-kh§.textWidth * 0.5) - 3;
               this.§_-kh§.y = -this.§_-kh§.textHeight;
            }
            this.§_-93u§.x = int(param1 * 0.5);
            addChild(this.§_-93u§);
         }
         else if(this.§_-93u§)
         {
            removeChild(this.§_-93u§);
         }
      }
      
      private function §_-g1A§(param1:GameEvent) : void
      {
         if(param1.data["type"] != §_-82O§.PLAYER_TYPE)
         {
            return;
         }
         this.league = param1.data["value"];
      }
   }
}

