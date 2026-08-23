package views
{
   import §_-S1n§.§_-kr§;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-4v§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-86§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-WS§;
   import events.GameEvent;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   
   public class §_-h10§ extends Sprite
   {
      
      private static var _instance:§_-h10§ = null;
      
      private static var §_-T1a§:Vector.<§_-41g§> = new Vector.<§_-41g§>(0);
      
      private var §_-f1t§:Boolean = false;
      
      private var §_-D29§:Boolean = false;
      
      private var §_-93Z§:SimpleButton = null;
      
      private var §_-G2o§:SimpleButton = null;
      
      private var §_-l1U§:Sprite = null;
      
      public function §_-h10§()
      {
         super();
         _instance = this;
         this.init();
         §_-LZ§.addEventListener(GameEvent.LEVEL_CHANGED,this.§_-22l§);
         §_-86§.addEventListener(GameEvent.AWARD_CHANGED,this.§_-127§);
         §_-WS§.addEventListener(GameEvent.COLLECTION_PICKUP,this.§_-V9§);
         §_-82O§.addEventListener(GameEvent.LEAGUE_CHANGED,this.§_-G1C§);
         §_-4v§.addEventListener(GameEvent.SHAMAN_LEVEL_CHANGED,this.§_-A3m§);
         §_-B2U§.listen(this.§_-s25§,GameEvent.TOTEM_BONUS,false);
         NuttyPassManager.addEventListener(NuttyPassManager.CHANGE,this.§_-B1v§);
         §_-p1V§.§_-63T§(this.§_-t29§);
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
         this.§_-93Z§ = new ButtonEventListShow();
         this.§_-93Z§.addEventListener(MouseEvent.CLICK,this.§_-O1s§);
         addChild(this.§_-93Z§);
         new §_-kr§(this.§_-93Z§,gls("Показывать ленту событий во время игры"));
         this.§_-G2o§ = new ButtonEventListHide();
         this.§_-G2o§.addEventListener(MouseEvent.CLICK,this.§_-M2s§);
         addChild(this.§_-G2o§);
         new §_-kr§(this.§_-G2o§,gls("Скрывать ленту событий во время игры"));
         this.§_-l1U§ = new Sprite();
         this.§_-l1U§.y = 30;
         addChild(this.§_-l1U§);
      }
      
      private function show() : void
      {
         this.§_-D29§ = true;
         this.§_-93Z§.alpha = 1;
         this.§_-l1U§.visible = true;
      }
      
      private function hide() : void
      {
         this.§_-D29§ = false;
         this.§_-93Z§.alpha = this.§_-f1t§ ? 0.3 : 1;
         this.§_-l1U§.visible = !this.§_-f1t§;
      }
      
      private function §_-O1s§(param1:MouseEvent) : void
      {
         this.§_-f1t§ = false;
         this.§_-93Z§.alpha = 1;
         this.§_-93Z§.visible = false;
         this.§_-G2o§.visible = true;
         this.§_-l1U§.visible = !this.§_-f1t§;
      }
      
      private function §_-M2s§(param1:MouseEvent) : void
      {
         this.§_-f1t§ = true;
         this.§_-93Z§.alpha = this.§_-D29§ ? 1 : 0.3;
         this.§_-93Z§.visible = true;
         this.§_-G2o§.visible = false;
         this.§_-l1U§.visible = this.§_-D29§ || !this.§_-f1t§;
      }
      
      private function add(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:§_-41g§ = new §_-41g§(param1,param2,param3);
         _loc4_.y = §_-T1a§.length * 40;
         this.§_-l1U§.addChild(_loc4_);
         _loc4_.start();
         §_-T1a§.push(_loc4_);
      }
      
      private function §_-t29§() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = int(§_-T1a§.length - 1);
         while(_loc2_ >= 0)
         {
            if(§_-T1a§[_loc2_].§_-59§)
            {
               §_-T1a§[_loc2_].stop();
            }
            if(§_-T1a§[_loc2_].§_-S2v§)
            {
               this.§_-l1U§.removeChild(§_-T1a§[_loc2_]);
               §_-T1a§.splice(_loc2_,1);
               _loc1_ = true;
            }
            _loc2_--;
         }
         if(!_loc1_)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < §_-T1a§.length)
         {
            §_-T1a§[_loc2_].offsetY = _loc2_ * 40;
            _loc2_++;
         }
      }
      
      private function §_-V9§(param1:GameEvent) : void
      {
         this.add(§_-41g§.§_-Xd§,param1.data["id"],param1.data["value"]);
      }
      
      private function §_-127§(param1:GameEvent) : void
      {
         this.add(§_-41g§.§_-13g§,param1.data["id"],param1.data["value"]);
      }
      
      private function §_-G1C§(param1:GameEvent) : void
      {
         if(param1.data["value"] == 0)
         {
            return;
         }
         this.add(§_-41g§.§_-5G§,param1.data["type"],param1.data["value"]);
      }
      
      private function §_-22l§(param1:GameEvent) : void
      {
         this.add(§_-41g§.§_-G2i§,0,param1.data["value"]);
         GameSounds.play("level_up");
      }
      
      private function §_-A3m§(param1:GameEvent) : void
      {
         this.add(§_-41g§.§_-qk§,0,param1.data["value"]);
         GameSounds.play("shaman_level_up");
      }
      
      private function §_-s25§(param1:GameEvent) : void
      {
         this.add(§_-41g§.§_-h2A§,param1.data["id"],param1.data["value"]);
      }
      
      private function §_-B1v§(param1:*) : void
      {
         var _loc3_:Object = null;
         var _loc2_:Array = NuttyPassManager.§_-8G§;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_)
            {
               this.add(§_-41g§.§_-g1D§,_loc3_.passType,_loc3_.taskId);
            }
         }
      }
   }
}

