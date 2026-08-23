package views
{
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-ct§;
   import §_-I10§.§_-d2x§;
   import §_-I10§.§_-f2P§;
   import §_-I10§.§_-k1C§;
   import §_-dc§.§_-e2W§;
   import §_-e1G§.§_-Hb§;
   import events.GameEvent;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   
   public class §_-mQ§ extends Sprite
   {
      
      private static var _instance:§_-mQ§ = null;
      
      private static var §_-RL§:Vector.<§_-H1K§> = new Vector.<§_-H1K§>(0);
      
      private var §_-x2I§:Boolean = false;
      
      private var §_-u2Y§:Boolean = false;
      
      private var §_-l2m§:SimpleButton = null;
      
      private var §_-72p§:SimpleButton = null;
      
      private var §_-w20§:Sprite = null;
      
      public function §_-mQ§()
      {
         super();
         _instance = this;
         this.init();
         §_-d2x§.addEventListener(GameEvent.LEVEL_CHANGED,this.§_-A1O§);
         §_-f2P§.addEventListener(GameEvent.AWARD_CHANGED,this.§_-x2v§);
         §_-k1C§.addEventListener(GameEvent.COLLECTION_PICKUP,this.§_-l1Y§);
         §_-13r§.addEventListener(GameEvent.LEAGUE_CHANGED,this.§_-K2x§);
         §_-ct§.addEventListener(GameEvent.SHAMAN_LEVEL_CHANGED,this.§_-u3§);
         §_-e2W§.listen(this.§_-x2s§,GameEvent.TOTEM_BONUS,false);
         NuttyPassManager.addEventListener(NuttyPassManager.CHANGE,this.§_-d15§);
         §_-01Y§.§_-c9§(this.§_-H5§);
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.show();
      }
      
      public static function hide() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.hide();
      }
      
      private function init() : void
      {
         this.y = 105;
         this.§_-l2m§ = new ButtonEventListShow();
         this.§_-l2m§.addEventListener(MouseEvent.CLICK,this.§_-027§);
         addChild(this.§_-l2m§);
         new §_-Hb§(this.§_-l2m§,gls("Показывать ленту событий во время игры"));
         this.§_-72p§ = new ButtonEventListHide();
         this.§_-72p§.addEventListener(MouseEvent.CLICK,this.§_-y1b§);
         addChild(this.§_-72p§);
         new §_-Hb§(this.§_-72p§,gls("Скрывать ленту событий во время игры"));
         this.§_-w20§ = new Sprite();
         this.§_-w20§.y = 30;
         addChild(this.§_-w20§);
      }
      
      private function show() : void
      {
         this.§_-u2Y§ = true;
         this.§_-l2m§.alpha = 1;
         this.§_-w20§.visible = true;
      }
      
      private function hide() : void
      {
         this.§_-u2Y§ = false;
         this.§_-l2m§.alpha = this.§_-x2I§ ? 0.3 : 1;
         this.§_-w20§.visible = !this.§_-x2I§;
      }
      
      private function §_-027§(param1:MouseEvent) : void
      {
         this.§_-x2I§ = false;
         this.§_-l2m§.alpha = 1;
         this.§_-l2m§.visible = false;
         this.§_-72p§.visible = true;
         this.§_-w20§.visible = !this.§_-x2I§;
      }
      
      private function §_-y1b§(param1:MouseEvent) : void
      {
         this.§_-x2I§ = true;
         this.§_-l2m§.alpha = this.§_-u2Y§ ? 1 : 0.3;
         this.§_-l2m§.visible = true;
         this.§_-72p§.visible = false;
         this.§_-w20§.visible = this.§_-u2Y§ || !this.§_-x2I§;
      }
      
      private function add(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:§_-H1K§ = new §_-H1K§(param1,param2,param3);
         _loc4_.y = §_-RL§.length * 40;
         this.§_-w20§.addChild(_loc4_);
         _loc4_.start();
         §_-RL§.push(_loc4_);
      }
      
      private function §_-H5§() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = int(§_-RL§.length - 1);
         while(_loc2_ >= 0)
         {
            if(§_-RL§[_loc2_].§_-e1W§)
            {
               §_-RL§[_loc2_].stop();
            }
            if(§_-RL§[_loc2_].§_-01y§)
            {
               this.§_-w20§.removeChild(§_-RL§[_loc2_]);
               §_-RL§.splice(_loc2_,1);
               _loc1_ = true;
            }
            _loc2_--;
         }
         if(!_loc1_)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < §_-RL§.length)
         {
            §_-RL§[_loc2_].offsetY = _loc2_ * 40;
            _loc2_++;
         }
      }
      
      private function §_-l1Y§(param1:GameEvent) : void
      {
         this.add(§_-H1K§.§_-M0§,param1.data["id"],param1.data["value"]);
      }
      
      private function §_-x2v§(param1:GameEvent) : void
      {
         this.add(§_-H1K§.§_-q2x§,param1.data["id"],param1.data["value"]);
      }
      
      private function §_-K2x§(param1:GameEvent) : void
      {
         if(param1.data["value"] == 0)
         {
            return;
         }
         this.add(§_-H1K§.§_-62m§,param1.data["type"],param1.data["value"]);
      }
      
      private function §_-A1O§(param1:GameEvent) : void
      {
         this.add(§_-H1K§.§_-73G§,0,param1.data["value"]);
         GameSounds.play("level_up");
      }
      
      private function §_-u3§(param1:GameEvent) : void
      {
         this.add(§_-H1K§.§_-AA§,0,param1.data["value"]);
         GameSounds.play("shaman_level_up");
      }
      
      private function §_-x2s§(param1:GameEvent) : void
      {
         this.add(§_-H1K§.§_-rB§,param1.data["id"],param1.data["value"]);
      }
      
      private function §_-d15§(param1:*) : void
      {
         var _loc3_:Object = null;
         var _loc2_:Array = NuttyPassManager.§_-Y3§;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_)
            {
               this.add(§_-H1K§.§_-51o§,_loc3_.passType,_loc3_.taskId);
            }
         }
      }
   }
}

