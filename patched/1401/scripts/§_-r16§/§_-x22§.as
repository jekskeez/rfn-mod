package §_-r16§
{
   import §_-I10§.§_-vy§;
   import §_-e1G§.§_-T1U§;
   import §_-e1G§.§_-kb§;
   import §_-f1x§.§_-Wb§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import tape.§_-K2k§;
   import utils.§_-Y25§;
   import utils.§_-x1Z§;
   
   public class §_-x22§ extends §_-K2k§
   {
      
      private static const §_-r2u§:int = 185;
      
      private static const §_-R1K§:int = 185;
      
      public static const §_-Xg§:String = "EXCHANGE";
      
      private var §_-XW§:§_-T1U§ = null;
      
      private var §_-OY§:Boolean = false;
      
      private var icon:DisplayObject = null;
      
      private var §_-h§:ButtonExchangeCollection = null;
      
      private var §_-D0§:§_-Y25§ = null;
      
      private var §_-m16§:§_-22V§ = null;
      
      public var elementId:int;
      
      public function §_-x22§(param1:int)
      {
         super();
         this.elementId = param1;
         this.graphics.beginFill(16250092);
         this.graphics.lineStyle(2,16049098);
         this.graphics.drawRoundRect(0,0,§_-r2u§,§_-R1K§,4,4);
         var _loc2_:§_-22V§ = new §_-22V§(§_-vy§.§_-C3T§[param1]["collectionName"],21,5,new TextFormat(§_-22V§.§_-F2z§,15,6697728,true,null,null,null,null,"center"));
         _loc2_.wordWrap = true;
         _loc2_.width = 141;
         addChild(_loc2_);
         var _loc3_:Class = §_-vy§.§_-R2S§(param1);
         this.icon = new _loc3_();
         this.icon.scaleX = this.icon.scaleY = 2;
         this.icon.x += int((§_-r2u§ - this.icon.width) * 0.5);
         this.icon.y += 30 + int((§_-R1K§ - this.icon.height - 30) * 0.5);
         addChild(this.icon);
         var _loc4_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,6697728,true,null,null,null,null,"right");
         this.§_-m16§ = new §_-22V§("0",135,155,_loc4_);
         this.§_-m16§.width = 40;
         this.§_-m16§.autoSize = TextFieldAutoSize.RIGHT;
         this.§_-m16§.mouseEnabled = false;
         addChild(this.§_-m16§);
         this.§_-h§ = new ButtonExchangeCollection();
         this.§_-h§.scaleX = this.§_-h§.scaleY = 0.65;
         this.§_-h§.x = 162;
         this.§_-h§.y = 3;
         this.§_-h§.addEventListener(MouseEvent.CLICK,this.§_-L1x§);
         addChild(this.§_-h§);
         new §_-kb§(this.§_-h§,gls("Собрать предмет"));
         this.§_-OY§ = true;
         this.§_-Lu§ = false;
         var _loc5_:String = "";
         if("exp" in §_-vy§.§_-C3T§[param1])
         {
            _loc5_ = §_-vy§.§_-C3T§[param1]["exp"] + "  ^";
         }
         this.§_-XW§ = new §_-T1U§(this.icon,§_-vy§.§_-C3T§[param1]["tittle"],§_-vy§.§_-C3T§[param1]["collectorDescription"],_loc5_);
      }
      
      public function get §_-Lu§() : Boolean
      {
         return this.§_-OY§;
      }
      
      public function set §_-Lu§(param1:Boolean) : void
      {
         if(this.§_-OY§ == param1)
         {
            return;
         }
         this.§_-OY§ = param1;
         this.§_-h§.visible = param1;
         this.icon.filters = param1 || Boolean(this.§_-93Y§) && Boolean(this.§_-93Y§.count > 0) ? [] : §_-x1Z§.§_-c2G§;
      }
      
      public function get §_-93Y§() : §_-Y25§
      {
         return this.§_-D0§;
      }
      
      public function set §_-93Y§(param1:§_-Y25§) : void
      {
         if(this.§_-D0§ == param1)
         {
            return;
         }
         if(this.§_-D0§ != null)
         {
            this.§_-D0§.removeEventListener(Event.CHANGE,this.§_-Dh§);
         }
         this.§_-D0§ = param1;
         this.§_-D0§.addEventListener(Event.CHANGE,this.§_-Dh§);
         this.§_-Dh§();
      }
      
      public function §_-31f§() : void
      {
         var _loc1_:§_-Wb§ = new §_-Wb§(this.elementId);
         _loc1_.x = this.icon.x;
         _loc1_.y = this.icon.y;
         addChild(_loc1_);
      }
      
      private function §_-Dh§(param1:Event = null) : void
      {
         this.icon.filters = this.§_-Lu§ || Boolean(this.§_-93Y§) && Boolean(this.§_-93Y§.count > 0) ? [] : §_-x1Z§.§_-c2G§;
         this.§_-m16§.text = Boolean(this.§_-93Y§) && this.§_-93Y§.count > 0 ? this.§_-93Y§.count.toString() : "";
      }
      
      private function §_-L1x§(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(§_-Xg§));
      }
   }
}

