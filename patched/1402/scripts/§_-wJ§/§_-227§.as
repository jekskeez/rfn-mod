package §_-wJ§
{
   import §_-5T§.§_-U11§;
   import §_-S1n§.§_-U2m§;
   import §_-S1n§.§_-z14§;
   import §_-X1k§.§_-42H§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import tape.§_-QN§;
   import utils.§_-Y11§;
   import utils.§_-y1l§;
   
   public class §_-227§ extends §_-QN§
   {
      
      private static const §_-B1t§:int = 185;
      
      private static const §_-u1l§:int = 185;
      
      public static const §_-V1G§:String = "EXCHANGE";
      
      private var §_-oj§:§_-z14§ = null;
      
      private var §_-32P§:Boolean = false;
      
      private var icon:DisplayObject = null;
      
      private var §_-O0§:ButtonExchangeCollection = null;
      
      private var §_-83h§:§_-Y11§ = null;
      
      private var §_-g1V§:§_-i5§ = null;
      
      public var elementId:int;
      
      public function §_-227§(param1:int)
      {
         super();
         this.elementId = param1;
         this.graphics.beginFill(16250092);
         this.graphics.lineStyle(2,16049098);
         this.graphics.drawRoundRect(0,0,§_-B1t§,§_-u1l§,4,4);
         var _loc2_:§_-i5§ = new §_-i5§(§_-42H§.§_-V10§[param1]["collectionName"],21,5,new TextFormat(§_-i5§.§_-c10§,15,6697728,true,null,null,null,null,"center"));
         _loc2_.wordWrap = true;
         _loc2_.width = 141;
         addChild(_loc2_);
         var _loc3_:Class = §_-42H§.§_-uI§(param1);
         this.icon = new _loc3_();
         this.icon.scaleX = this.icon.scaleY = 2;
         this.icon.x += int((§_-B1t§ - this.icon.width) * 0.5);
         this.icon.y += 30 + int((§_-u1l§ - this.icon.height - 30) * 0.5);
         addChild(this.icon);
         var _loc4_:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,6697728,true,null,null,null,null,"right");
         this.§_-g1V§ = new §_-i5§("0",135,155,_loc4_);
         this.§_-g1V§.width = 40;
         this.§_-g1V§.autoSize = TextFieldAutoSize.RIGHT;
         this.§_-g1V§.mouseEnabled = false;
         addChild(this.§_-g1V§);
         this.§_-O0§ = new ButtonExchangeCollection();
         this.§_-O0§.scaleX = this.§_-O0§.scaleY = 0.65;
         this.§_-O0§.x = 162;
         this.§_-O0§.y = 3;
         this.§_-O0§.addEventListener(MouseEvent.CLICK,this.§_-E7§);
         addChild(this.§_-O0§);
         new §_-U2m§(this.§_-O0§,gls("Собрать предмет"));
         this.§_-32P§ = true;
         this.§_-Z2s§ = false;
         var _loc5_:String = "";
         if("exp" in §_-42H§.§_-V10§[param1])
         {
            _loc5_ = §_-42H§.§_-V10§[param1]["exp"] + "  ^";
         }
         this.§_-oj§ = new §_-z14§(this.icon,§_-42H§.§_-V10§[param1]["tittle"],§_-42H§.§_-V10§[param1]["collectorDescription"],_loc5_);
      }
      
      public function get §_-Z2s§() : Boolean
      {
         return this.§_-32P§;
      }
      
      public function set §_-Z2s§(param1:Boolean) : void
      {
         if(this.§_-32P§ == param1)
         {
            return;
         }
         this.§_-32P§ = param1;
         this.§_-O0§.visible = param1;
         this.icon.filters = param1 || Boolean(this.§_-fv§) && Boolean(this.§_-fv§.count > 0) ? [] : §_-y1l§.§_-Tk§;
      }
      
      public function get §_-fv§() : §_-Y11§
      {
         return this.§_-83h§;
      }
      
      public function set §_-fv§(param1:§_-Y11§) : void
      {
         if(this.§_-83h§ == param1)
         {
            return;
         }
         if(this.§_-83h§ != null)
         {
            this.§_-83h§.removeEventListener(Event.CHANGE,this.§_-A2n§);
         }
         this.§_-83h§ = param1;
         this.§_-83h§.addEventListener(Event.CHANGE,this.§_-A2n§);
         this.§_-A2n§();
      }
      
      public function §_-Z28§() : void
      {
         var _loc1_:§_-U11§ = new §_-U11§(this.elementId);
         _loc1_.x = this.icon.x;
         _loc1_.y = this.icon.y;
         addChild(_loc1_);
      }
      
      private function §_-A2n§(param1:Event = null) : void
      {
         this.icon.filters = this.§_-Z2s§ || Boolean(this.§_-fv§) && Boolean(this.§_-fv§.count > 0) ? [] : §_-y1l§.§_-Tk§;
         this.§_-g1V§.text = Boolean(this.§_-fv§) && this.§_-fv§.count > 0 ? this.§_-fv§.count.toString() : "";
      }
      
      private function §_-E7§(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(§_-V1G§));
      }
   }
}

