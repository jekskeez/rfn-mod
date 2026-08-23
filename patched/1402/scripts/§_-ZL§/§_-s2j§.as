package §_-ZL§
{
   import §_-8Q§.BalloonBody;
   import §_-8Q§.GameBody;
   import §_-8Q§.§_-51I§;
   import §_-8Q§.§_-82W§;
   import §_-8Q§.§_-91x§;
   import §_-8Q§.§_-IE§;
   import §_-8Q§.§_-Lr§;
   import §_-8Q§.§_-YO§;
   import §_-8Q§.§_-YZ§;
   import §_-8Q§.§_-fp§;
   import §_-8Q§.§_-m1m§;
   import §_-8Q§.§_-r§;
   import §_-8Q§.§_-r2V§;
   import §_-8Q§.§_-v1O§;
   import §_-8Q§.§_-y1c§;
   import §_-A3j§.§_-b1N§;
   import §_-B1G§.ScrollPane;
   import §_-B1G§.§_-mD§;
   import §_-F6§.§_-v2T§;
   import §_-M16§.§_-X1G§;
   import §_-M16§.§_-Z2x§;
   import §_-M16§.§_-p11§;
   import §_-M16§.§_-y1D§;
   import §_-bN§.Dialog;
   import §_-d24§.*;
   import §_-j2H§.ClickButton;
   import §_-j2H§.ScriptedTimer;
   import §_-j2H§.Sensor;
   import §_-j2H§.§_-01b§;
   import §_-j2H§.§_-52m§;
   import §_-j2H§.§_-9A§;
   import §_-j2H§.§_-L2K§;
   import §_-j2H§.§_-d2T§;
   import §_-j2H§.§_-k2G§;
   import avmplus.getQualifiedClassName;
   import events.§_-F2k§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import game.mainGame.GameMap;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-s2j§ extends Dialog
   {
      
      private static const §_-21s§:Array = [DisplayObject,§_-xn§,GameBody,§_-X1G§,§_-p11§,§_-Z2x§,§_-y1D§,Sensor,§_-52m§,§_-41O§,GameMap,§_-v2T§,§_-b1N§,§_-01b§,ScriptedTimer,BalloonBody,ClickButton,§_-k2G§,§_-L2K§,§_-d2T§,§_-71b§,§_-r2V§,§_-m1m§,§_-r§,§_-91x§,§_-fp§,§_-Lr§,§_-y1c§,§_-9A§,§_-YO§,§_-51I§,§_-IE§,§_-82W§,§_-YZ§,§_-v1O§];
      
      private static var §_-7Y§:Dictionary = null;
      
      private static var §_-H2A§:Vector.<Function> = new Vector.<Function>();
      
      private var §_-W18§:ScrollPane = new ScrollPane();
      
      private var §_-51V§:Sprite = new Sprite();
      
      private var inspectObject:*;
      
      private var §_-7X§:§_-eA§;
      
      public function §_-s2j§(param1:*)
      {
         super(gls("Свойства объекта"));
         if(§_-s2j§.§_-7Y§ == null)
         {
            this.§_-u1H§();
         }
         this.§_-W18§.setSize(375,430);
         this.§_-W18§.source = this.§_-51V§;
         addChild(this.§_-W18§);
         this.§_-W18§.update();
         this.§_-PE§(param1);
         place();
         this.width = 400;
         this.height = 480;
         show();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§,false,0,true);
      }
      
      public static function §_-c1L§(param1:Function) : void
      {
         §_-H2A§.push(param1);
      }
      
      public static function §_-e2Q§(param1:Function) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-H2A§.length)
         {
            if(§_-H2A§[_loc2_] == param1)
            {
               §_-H2A§.splice(_loc2_,1);
            }
            _loc2_++;
         }
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         §_-mD§.§_-E1f§();
         while(this.§_-51V§.numChildren > 0)
         {
            (this.§_-51V§.getChildAt(0) as §_-eA§).removeEventListener(§_-F2k§.CHANGE,this.dispatch);
            (this.§_-51V§.getChildAt(0) as §_-eA§).dispose();
            this.§_-51V§.removeChildAt(0);
         }
         this.§_-7X§ = null;
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         super.hide(param1);
      }
      
      public function §_-PE§(param1:*) : void
      {
         var _loc2_:* = undefined;
         this.inspectObject = param1;
         for each(_loc2_ in §_-21s§)
         {
            if(param1 is _loc2_)
            {
               if(_loc2_ in §_-7Y§)
               {
                  this.§_-d2P§(new (§_-7Y§[_loc2_] as Class)() as §_-eA§);
                  if(param1 is §_-Kf§ && getQualifiedClassName(param1) == getQualifiedClassName(_loc2_))
                  {
                     break;
                  }
               }
            }
         }
         this.§_-W18§.update();
      }
      
      private function §_-d2P§(param1:§_-eA§) : void
      {
         if(this.§_-7X§)
         {
            param1.y = this.§_-7X§.y + this.§_-7X§.§_-52t§ + 10;
         }
         param1.inspectObject = this.inspectObject;
         param1.addEventListener(§_-F2k§.CHANGE,this.dispatch);
         this.§_-7X§ = param1;
         this.§_-51V§.addChild(param1);
         this.§_-W18§.update();
      }
      
      private function dispatch(param1:§_-F2k§) : void
      {
         var _loc2_:Function = null;
         for each(_loc2_ in §_-H2A§)
         {
            _loc2_(param1.className);
         }
      }
      
      private function §_-u1H§() : void
      {
         §_-s2j§.§_-7Y§ = new Dictionary();
         §_-s2j§.§_-7Y§[DisplayObject] = §_-h2u§;
         §_-s2j§.§_-7Y§[§_-xn§] = §_-91d§;
         §_-s2j§.§_-7Y§[GameBody] = §_-ZE§;
         §_-s2j§.§_-7Y§[§_-X1G§] = §_-TU§;
         §_-s2j§.§_-7Y§[§_-p11§] = §_-MX§;
         §_-s2j§.§_-7Y§[§_-Z2x§] = §_-zi§;
         §_-s2j§.§_-7Y§[§_-y1D§] = §_-OY§;
         §_-s2j§.§_-7Y§[Sensor] = §_-Jn§;
         §_-s2j§.§_-7Y§[§_-52m§] = §_-V1s§;
         §_-s2j§.§_-7Y§[§_-41O§] = §_-t1X§;
         §_-s2j§.§_-7Y§[GameMap] = §_-V7§;
         §_-s2j§.§_-7Y§[§_-b1N§] = §_-C3M§;
         §_-s2j§.§_-7Y§[§_-01b§] = §_-N2V§;
         §_-s2j§.§_-7Y§[ScriptedTimer] = §_-h1R§;
         §_-s2j§.§_-7Y§[BalloonBody] = §_-b22§;
         §_-s2j§.§_-7Y§[ClickButton] = §_-I19§;
         §_-s2j§.§_-7Y§[§_-k2G§] = §_-1B§;
         §_-s2j§.§_-7Y§[§_-L2K§] = §_-23r§;
         §_-s2j§.§_-7Y§[§_-d2T§] = §_-Ft§;
         §_-s2j§.§_-7Y§[§_-71b§] = §_-92S§;
         §_-s2j§.§_-7Y§[§_-v2T§] = §_-L1P§;
         §_-s2j§.§_-7Y§[§_-r2V§] = §_-q2y§;
         §_-s2j§.§_-7Y§[§_-m1m§] = §_-C39§;
         §_-s2j§.§_-7Y§[§_-r§] = §_-V1c§;
         §_-s2j§.§_-7Y§[§_-91x§] = §_-Y21§;
         §_-s2j§.§_-7Y§[§_-fp§] = §_-x1g§;
         §_-s2j§.§_-7Y§[§_-Lr§] = §_-12r§;
         §_-s2j§.§_-7Y§[§_-y1c§] = §_-CK§;
         §_-s2j§.§_-7Y§[§_-9A§] = §_-H1d§;
         §_-s2j§.§_-7Y§[§_-YO§] = §_-x21§;
         §_-s2j§.§_-7Y§[§_-51I§] = §_-63W§;
         §_-s2j§.§_-7Y§[§_-IE§] = §_-N1w§;
         §_-s2j§.§_-7Y§[§_-82W§] = §_-R1Q§;
         §_-s2j§.§_-7Y§[§_-YZ§] = §_-zC§;
         §_-s2j§.§_-7Y§[§_-v1O§] = §_-223§;
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
      {
         if(!param1.ctrlKey || param1.keyCode != Keyboard.Q)
         {
            return;
         }
         this.hide();
      }
   }
}

