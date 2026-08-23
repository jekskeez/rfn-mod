package
{
   import §_-I10§.§_-13r§;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-92z§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import views.§_-914§;
   
   public class §_-P1U§ extends §_-h2I§
   {
      
      private static const §_-c2T§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,14542830,false);
      
      private static const §_-v2T§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,9886972,true);
      
      private static const §_-E1Y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,9886972,true);
      
      private static const §_-Y2h§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,16515005,true);
      
      private static const §_-G2i§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,16731507,true);
      
      private static const §_-h1o§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,16731507,true);
      
      private static const §_-T1k§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,9,16768368,false);
      
      private static const §_-X2M§:DropShadowFilter = new DropShadowFilter(0,45,2900327,1,4,4,4);
      
      private static const §_-M1y§:DropShadowFilter = new DropShadowFilter(0,45,2900327,1,3,3,1);
      
      private var playerId:int;
      
      private var §_-L1v§:TextFormat = null;
      
      private var §_-b1u§:Array = [];
      
      private var §_-TM§:TextFormat = null;
      
      private var §_-J9§:Array = [];
      
      private var §_-O1y§:Boolean = false;
      
      private var §_-21k§:Sprite = null;
      
      private var §_-z4§:int = Hero.§_-JL§;
      
      private var §_-Wi§:DisplayObject = null;
      
      private var §_-Z25§:§_-914§ = null;
      
      private var §_-h1I§:§_-22V§ = null;
      
      private var §_-Uk§:§_-22V§ = null;
      
      private var §_-Pe§:§_-22V§ = null;
      
      private var §_-23W§:§_-h2I§ = null;
      
      public function §_-P1U§(param1:int)
      {
         super();
         this.playerId = param1;
         this.init();
         if(this.playerId == Game.selfId)
         {
            §_-13r§.addEventListener(GameEvent.LEAGUE_CHANGED,this.§_-42g§);
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
         if(this.§_-23W§)
         {
            this.§_-23W§.removeFromParent(true);
         }
         this.§_-23W§ = null;
      }
      
      public function set team(param1:int) : void
      {
         if(this.§_-z4§ == param1)
         {
            return;
         }
         this.§_-z4§ = param1;
         if(this.playerId == Game.selfId)
         {
            return;
         }
         switch(this.§_-z4§)
         {
            case Hero.§_-114§:
               this.§_-L1v§ = §_-v2T§;
               this.§_-TM§ = §_-E1Y§;
               this.§_-b1u§ = [§_-X2M§];
               break;
            case Hero.§_-17§:
               this.§_-L1v§ = §_-G2i§;
               this.§_-TM§ = §_-h1o§;
               this.§_-b1u§ = [§_-X2M§];
               break;
            default:
               this.§_-L1v§ = §_-c2T§;
               this.§_-TM§ = §_-E1Y§;
               this.§_-b1u§ = [];
         }
         this.§_-u1D§(this.§_-O1y§);
      }
      
      public function set shaman(param1:Boolean) : void
      {
         if(this.§_-O1y§ == param1)
         {
            return;
         }
         this.§_-O1y§ = param1;
         this.§_-u1D§(this.§_-O1y§);
      }
      
      public function set §_-J10§(param1:int) : void
      {
         this.§_-h1I§.text = param1.toString();
      }
      
      public function set playerName(param1:String) : void
      {
         this.§_-Uk§.text = param1;
      }
      
      public function get §_-6w§() : String
      {
         return this.§_-Pe§.text;
      }
      
      public function set §_-6w§(param1:String) : void
      {
         this.§_-Pe§.text = param1;
      }
      
      public function set league(param1:int) : void
      {
         if(!this.§_-Z25§)
         {
            this.§_-Z25§ = new §_-914§(this.playerId,§_-13r§.PLAYER_TYPE,0.6,true,true);
            this.§_-Z25§.y = 5;
            addChild(this.§_-Z25§);
         }
         this.§_-Z25§.league = param1;
      }
      
      public function set §_-63c§(param1:Boolean) : void
      {
         this.§_-Wi§.visible = param1;
      }
      
      public function redraw() : void
      {
         this.graphics.clear();
         if(this.§_-Uk§.text == "")
         {
            return;
         }
         var _loc1_:int = Math.max(this.§_-Uk§.textWidth,this.§_-Pe§.textWidth) + (this.§_-Z25§.width > 0 || this.§_-Wi§.visible ? 30 : 20);
         var _loc2_:int = this.§_-Pe§.text == "" ? 20 : 30;
         this.§_-Uk§.x = int((_loc1_ - this.§_-Uk§.textWidth) * 0.5) - 2;
         this.§_-Pe§.x = int((_loc1_ - this.§_-Pe§.textWidth) * 0.5) - 1;
         this.graphics.beginFill(0,0);
         if(this.§_-O1y§)
         {
            this.graphics.beginFill(16777215,0.45);
         }
         if(this.playerId == Game.selfId)
         {
            this.graphics.beginFill(0,0.45);
         }
         this.graphics.drawRoundRect(0,0,_loc1_,_loc2_,10);
         this.graphics.endFill();
         this.§_-Wi§.x = _loc1_ - 5;
         if(this.§_-23W§)
         {
            this.§_-23W§.removeFromParent(true);
         }
         this.§_-23W§ = null;
         this.§_-01c§(_loc1_);
         this.§_-23W§ = new §_-h2I§(this,true);
         this.§_-23W§.pivotX = 0;
         this.§_-23W§.pivotY = -80 + _loc2_;
         this.§_-23W§.x = -int(_loc1_ * 0.5);
         §_-83v§(this.§_-23W§);
      }
      
      private function init() : void
      {
         if(this.playerId == Game.selfId)
         {
            this.§_-L1v§ = §_-Y2h§;
            this.§_-b1u§ = [§_-X2M§];
            this.§_-TM§ = §_-Y2h§;
            this.§_-J9§ = [§_-X2M§];
         }
         else
         {
            this.§_-L1v§ = §_-c2T§;
            this.§_-b1u§ = [§_-M1y§];
            this.§_-TM§ = §_-E1Y§;
            this.§_-J9§ = [§_-X2M§];
         }
         this.§_-Uk§ = new §_-22V§("",0,0,this.§_-L1v§);
         this.§_-Uk§.filters = this.§_-b1u§;
         addChild(this.§_-Uk§);
         this.§_-Pe§ = new §_-22V§("",0,15,§_-T1k§);
         this.§_-Pe§.filters = this.§_-b1u§;
         addChild(this.§_-Pe§);
         this.§_-h1I§ = new §_-22V§("",0,0,new TextFormat(§_-22V§.§_-pJ§,15,76372));
         this.§_-Wi§ = new ImageNameVIP();
         this.§_-Wi§.y = -5;
         this.§_-Wi§.visible = false;
         addChild(this.§_-Wi§);
      }
      
      private function §_-u1D§(param1:Boolean) : void
      {
         if(param1)
         {
            this.§_-Uk§.defaultTextFormat = this.§_-TM§;
            this.§_-Uk§.setTextFormat(this.§_-TM§);
            this.§_-Uk§.filters = this.§_-J9§;
         }
         else
         {
            this.§_-Uk§.defaultTextFormat = this.§_-L1v§;
            this.§_-Uk§.setTextFormat(this.§_-L1v§);
            this.§_-Uk§.filters = this.§_-b1u§;
         }
         this.redraw();
      }
      
      private function §_-01c§(param1:int) : void
      {
         if(this.§_-O1y§ && §_-92z§.mode != §_-q1p§.§_-w1Y§ && this.§_-h1I§.text != "")
         {
            if(!this.§_-21k§)
            {
               this.§_-21k§ = new Sprite();
               this.§_-21k§.addChild(this.§_-z4§ == Hero.§_-17§ ? new ImageNameShamanRed() : new ImageNameShaman());
               this.§_-21k§.addChild(this.§_-h1I§);
               this.§_-h1I§.x = -int(this.§_-h1I§.textWidth * 0.5) - 3;
               this.§_-h1I§.y = -this.§_-h1I§.textHeight;
            }
            this.§_-21k§.x = int(param1 * 0.5);
            addChild(this.§_-21k§);
         }
         else if(this.§_-21k§)
         {
            removeChild(this.§_-21k§);
         }
      }
      
      private function §_-42g§(param1:GameEvent) : void
      {
         if(param1.data["type"] != §_-13r§.PLAYER_TYPE)
         {
            return;
         }
         this.league = param1.data["value"];
      }
   }
}

