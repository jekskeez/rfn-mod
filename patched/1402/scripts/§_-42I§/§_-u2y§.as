package §_-42I§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.events.KeyboardEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class §_-u2y§ extends §_-w1Y§
   {
      
      private var §_-R16§:TextField = new TextField();
      
      private var §_-B2w§:TextField = new TextField();
      
      private var §_-e1G§:TextField = new TextField();
      
      private var §_-MF§:String;
      
      private var §_-61u§:Number;
      
      private var §_-dJ§:Number;
      
      public function §_-u2y§(param1:String, param2:String, param3:Number = 1, param4:Number = NaN)
      {
         super();
         this.§_-MF§ = param2;
         this.§_-61u§ = param3;
         this.§_-dJ§ = param4;
         this.§_-e1G§.text = param1;
         §_-G1V§(this.§_-e1G§);
         this.§_-e1G§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-e1G§.restrict = "-[0-9].";
         this.§_-e1G§.maxChars = 7;
         this.§_-e1G§.height = this.§_-e1G§.textHeight;
         addChild(this.§_-e1G§);
         this.§_-R16§.name = "x";
         this.§_-R16§.y = this.§_-e1G§.textHeight + 5;
         this.§_-R16§.width = 50;
         this.§_-R16§.height = 20;
         this.§_-R16§.background = true;
         this.§_-R16§.restrict = "-[0-9].";
         this.§_-R16§.maxChars = 7;
         this.§_-R16§.type = TextFieldType.INPUT;
         §_-G1V§(this.§_-R16§,§_-yI§);
         this.§_-R16§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         this.§_-R16§.selectable = true;
         this.§_-R16§.mouseEnabled = true;
         addChild(this.§_-R16§);
         this.§_-B2w§.name = "y";
         this.§_-B2w§.x = 75;
         this.§_-B2w§.y = this.§_-e1G§.textHeight + 5;
         this.§_-B2w§.width = 50;
         this.§_-B2w§.height = 20;
         this.§_-B2w§.background = true;
         this.§_-B2w§.restrict = "-[0-9].";
         this.§_-B2w§.maxChars = 7;
         this.§_-B2w§.type = TextFieldType.INPUT;
         §_-G1V§(this.§_-B2w§,§_-yI§);
         this.§_-B2w§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         this.§_-B2w§.selectable = true;
         addChild(this.§_-B2w§);
      }
      
      override public function get inspectObject() : *
      {
         return super.inspectObject;
      }
      
      override public function set inspectObject(param1:*) : void
      {
         super.inspectObject = param1;
         this.§_-R16§.text = String(param1[this.§_-MF§].x * this.§_-61u§);
         this.§_-B2w§.text = String(param1[this.§_-MF§].y * this.§_-61u§);
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         if(!isNaN(this.§_-dJ§))
         {
            this.§_-R16§.text = Math.max(this.§_-dJ§ * this.§_-61u§,Number(this.§_-R16§.text)).toString();
            this.§_-B2w§.text = Math.max(this.§_-dJ§ * this.§_-61u§,Number(this.§_-B2w§.text)).toString();
         }
         this.inspectObject[this.§_-MF§] = this.inspectObject[this.§_-MF§] is b2Vec2 ? new b2Vec2(Number(this.§_-R16§.text) / this.§_-61u§,Number(this.§_-B2w§.text) / this.§_-61u§) : new Point(Number(this.§_-R16§.text) / this.§_-61u§,Number(this.§_-B2w§.text) / this.§_-61u§);
         dispatch();
      }
   }
}

